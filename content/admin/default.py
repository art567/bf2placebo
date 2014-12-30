# vim: ts=4 noexpandtab
#
# Battlefield II -- default remote console module.
#
# This is a very simple, TCP based remote console which does simple MD5 digest
# password authentication. It can be configured via the admin/default.cfg file.
# Recognized options are 'port' and 'password'.
#
# Implementation guidelines for this file (and for your own rcon modules):
#
#  - All socket operations MUST be non-blocking. If your module blocks on a
#    socket the game server will hang.
#
#  - Do as little work as possible in update() as it runs in the server main
#    loop.
#
# Other notes:
#
#  - To get end-of-message markers (0x04 hex) after each reply, begin your
#    commands with an ascii 0x02 code. This module will then append the
#    end-of-message marker to all results. This is useful if you need to wait
#    for a complete response.
#
# Copyright (c)2004 Digital Illusions CE AB
# Author: Andreas `dep' Fredriksson

import socket
import errno
import host
import bf2
import types
import md5
import string
import random

options = {
	'port': '4711',
	'password': None,

	# True if multiple commands should be processed in one update and
	# if as many responses as possible should be sent each update.
	'allowBatching': False
}

# Returns a seed string of random characters to be used as a salt to protect
# password sniffing.
def make_seed(seed_length):
	return ''.join([string.ascii_letters[random.randint(0, len(string.ascii_letters)-1)] for x in xrange(0, seed_length)])

# Concats a seed string with the password and returns an ASCII-hex MD5 digest.
def digest(seed, pw):
	if not pw: return None
	m = md5.new()
	m.update(seed)
	m.update(pw)
	return m.hexdigest()

# Parses the config file, if it's there
def parseConfig():
	def boolFromString (str):
		if str in ['True', 'true', '1']:
			return True
		elif value in ['False', 'false', '0']:
			return False
		else:
			raise ValueError

	fn = 'admin/default.cfg'
	try:
		config = open(fn, 'r')
		lineNo = 0
		for line in config:
			lineNo += 1
			if line.strip() != '' and line.strip() != '\n':
				try:
					(key, value) = line.split('=')
					key = key.strip()
					value = value.strip()
					
					if key == 'allowBatching': value = boolFromString (value)
					options[key] = value
					
				except ValueError:
					print 'warning: syntax error in "%s" on line %d' % (fn, lineNo)
	except IOError, detail:
		print 'warning: couldn\'t read "%s": %s' % (fn, detail)

# A stateful output buffer that knows how to enqueue data and ship it out
# without blocking.
class OutputBuffer(object):

	def __init__(self, sock):
		self.sock = sock
		self.data = []
		self.index = 0

	def enqueue(self, str):
		self.data.append(str)

	def update(self):
		allowBatching = options['allowBatching']
		while len(self.data) > 0:
			try:
				item = self.data[0]
				scount = self.sock.send(item[self.index:])
				self.index += scount
				if self.index == len(item):
					del self.data[0]
					self.index = 0
			except socket.error, detail:
				if detail[0] != errno.EWOULDBLOCK:
					return detail[1]
			if not allowBatching:
				break
		return None

# Each TCP connection is represented by an object of this class.
class AdminConnection(object):

	def __init__(self, srv, sock, addr):
		print 'new rcon/admin connection from %s:%d' % (addr[0], addr[1])
		self.server = srv
		self.sock = sock
		self.addr = addr
		self.sock.setblocking(0)
		self.buffer = ''
		self.seed = make_seed(16)
		self.correct_digest = digest(self.seed, options['password'])
		self.outbuf = OutputBuffer(self.sock)
		
		# Welcome message *must* end with \n\n
		self.outbuf.enqueue('### Battlefield 2 default RCON/admin ready.\n')
		self.outbuf.enqueue('### Digest seed: %s\n' % (self.seed))
		self.outbuf.enqueue('\n') # terminate welcome message with extra LF

	def update(self):
		err = None
		try:
			allowBatching = options['allowBatching']
			while not err:
				data = self.sock.recv(1024)
				if data:
					self.buffer += data
					while not err:
						nlpos = self.buffer.find('\n')
						if nlpos != -1:
							self.server.onRemoteCommand(self, self.buffer[0:nlpos])
							self.buffer = self.buffer[nlpos+1:] # keep rest of buffer
						else:
							if len(self.buffer) > 128:
								err = 'data format error: no newline in message'
							break
						if not allowBatching: break
				else:
					err = 'peer disconnected'
				
				if not allowBatching: break

		except socket.error, detail:
			if detail[0] != errno.EWOULDBLOCK:
				err = detail[1]

		if not err:
			err = self.outbuf.update()

		if err:
			print 'rcon: closing %s:%d: %s' % (self.addr[0], self.addr[1], err)
			try:
				self.sock.shutdown(2)
				self.sock.close()
			except:
				print 'rcon: warning: failed to close %s' % (self.addr)
				pass
			return 0
		else:
			return 1

# Context passed to remote command implementations for them to write output to
# either a remote tcp socket or an in-game client executing 'rcon <command>'.
class CommandContext(object):
	def __init__(self):
		self.player = None
		self.socket = None
		self.output = []

	def isInGame(self): return self.player is not None
	def isSocket(self): return self.socket is not None
	def write(self, text): self.output.append(text)

# The server itself.
class AdminServer(object):

	def __init__(self, port):
		# state for tcp rcon connections
		self.port = port
		self.backlog = 1
		self.peers = []
		self.openSocket()

		# state for in-game rcon connections
		host.registerHandler('RemoteCommand', self.onRemoteCommand, 1)
		host.registerHandler('PlayerDisconnect', self.onPlayerDisconnect, 1)
		host.registerHandler('ChatMessage', self.onChatMessage, 1)

		# contains player ids for players which have successfully authenticated
		# themselves with 'rcon login <passwd>'
		self.authed_players = {}
		# contains sockets for connections which have successfully authenticated
		# themselves with 'login <passwd>'
		self.authed_sockets = {}

		# rcon commands supported in this vanilla version
		self.rcon_cmds = {
			'login': self.rcmd_login,
			'users': self.rcmd_users,
			'exec': self.rcmd_exec
		}

	# Called when a user types 'rcon ' followed by any string in a client
	# console window or when a TCP client sends a complete line to be
	# evaluated.
	def onRemoteCommand(self, playerid_or_socket, cmd):
		cmd = cmd.strip()
		interactive = True

		# Is this a non-interactive client?
		if len(cmd) > 0 and cmd[0] == '\x02':
			cmd = cmd[1:]
			interactive = False

		spacepos = cmd.find(' ')
		if spacepos == -1: spacepos=len(cmd)
		subcmd = cmd[0:spacepos]

		ctx = CommandContext()
		authed = 0
		if type(playerid_or_socket) == types.IntType:
			ctx.player = playerid_or_socket
			authed = self.authed_players.has_key(ctx.player)
		else:
			ctx.socket = playerid_or_socket
			authed = self.authed_sockets.has_key(ctx.socket)
			
		# you can only login unless you are authenticated
		if subcmd != 'login' and not authed:
			ctx.write('error: not authenticated: you can only invoke \'login\'\n')
		else:
			if self.rcon_cmds.has_key(subcmd):
				self.rcon_cmds[subcmd](ctx, cmd[spacepos+1:])
			else:
				ctx.write('unknown command: \'%s\'\n' % (subcmd))

		feedback = ''.join(ctx.output)
		if ctx.socket:
			if interactive:
				ctx.socket.outbuf.enqueue(feedback)
			else:
				ctx.socket.outbuf.enqueue(feedback + '\x04')
		else:
			host.rcon_feedback(ctx.player, feedback)

	# When players disconnect, remove them from the auth map if they were
	# authenticated so that the next user with the same id doesn't get rcon
	# access.
	def onPlayerDisconnect(self, player):
		if self.authed_players.has_key(player.index):
			del self.authed_players[player.index]


	# Called whenever a player issues a chat string.
	def onChatMessage(self, player_id, text, channel, flags):
		print 'chat: pid=%d text=\'%s\' channel=%s' % (player_id, text, channel)

	# Sets up the listening TCP RCON socket. This binds to 0.0.0.0, which may
	# not be what you want but it's a sane default for most installations.
	def openSocket(self):
		try:
			self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			#self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_LINGER, 0)
			self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
			self.sock.bind(('0.0.0.0', self.port))
			self.sock.listen(self.backlog)
			self.sock.setblocking(0)
		except socket.error, detail:
			print 'failed to bind rcon socket--only in-game rcon will be enabled'

	# WARNING: update is called very frequently -- don't go crazy with logic
	# here.
	def update(self):
		# if we don't have a socket, just return
		if not self.sock: return

		# without blocking, check for new connections
		try:
			conn, peeraddr = self.sock.accept()
			self.peers.append(AdminConnection(self, conn, peeraddr))
		except socket.error, detail:
			if detail[0] != errno.EWOULDBLOCK:
				raise socket.error, detail

		# update clients and mark connections that fail their update
		disc = []
		for client in self.peers:
			if not client.update(): disc.append(client)

		# delete any auth status for closed tcp connections
		for d in disc:
			if self.authed_sockets.has_key(d): del self.authed_sockets[d]

		# now keep the remaining clients
		self.peers = filter(lambda x: x not in disc, self.peers)

	def shutdown(self):
		if self.sock:
			self.sock.close()

	# Command implementations go here (member functions of the AdminServer)

	# Allows a in-game rcon client to authenticate and get access.
	def rcmd_login(self, ctx, cmd):
		success = 0
		if ctx.isInGame():
			# We're called by an in-game rcon client, use plain-text password
			# (encoded into bf2 network stream).
			if cmd.strip() == options['password']:
					self.authed_players[ctx.player] = 1
					success = 1
			elif self.authed_players.has_key(ctx.player):
					del self.authed_players[ctx.player]
		else:
			# tcp client, require seeded digest to match instead of pw
			if cmd.strip() == ctx.socket.correct_digest:
				self.authed_sockets[ctx.socket] = 1
				print 'rcon: tcp client from %s:%d logged on' % ctx.socket.addr
				success = 1
			else:
				if self.authed_sockets.has_key(ctx.socket):
					del self.authed_sockets[ctx.socket]
				print 'rcon: tcp client from %s:%d failed pw challenge' % ctx.socket.addr

		if success:
			ctx.write('Authentication successful, rcon ready.\n')
		else:
			ctx.write('Authentication failed.\n')

	# Lists rcon-authenticated players.
	def rcmd_users(self, ctx, cmd):
		ctx.write('active rcon users:\n')
		for id in self.authed_players:
			if id == -1:
				ctx.write('-1 (local server console)\n')
			else:
				try:
					player = bf2.playerManager.getPlayerByIndex(id)
					ctx.write('%d from %s name=\'%s\'\n' % (id, player.getAddress(), player.getName()))
				except:
					ctx.write('%d (no info)\n' % (id))

		for peer in self.authed_sockets:
			ctx.write('tcp: %s:%d\n' % (peer.addr[0], peer.addr[1]))

	# Executes a console command on the server.
	def rcmd_exec(self, ctx, cmd):
		ctx.write(host.rcon_invoke(cmd))

# parse the configuration file
parseConfig()

# our single server instance
server = AdminServer(int(options['port']))

# These functions are called from the engine -- we implement them in terms of a
# class instance:


def init():
	print 'initializing default admin/rcon module'
	
	# load (optional) admin scripts like teamkill punish and autobalance
	import standard_admin


def shutdown():
	if server:
		print 'shutting down default admin/rcon module'
		server.shutdown()

def update():
	if server: server.update()
