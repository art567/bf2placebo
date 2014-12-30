#
# Integrated from BF2142, for BF2 this is just the "upper half" of the GameSpy response handler.
# Originally written by Niklas Henriks, added to BF2 by Emil Brink (April, 2009).
#
# Copyright (c)2006-2009 Digital Illusions CE AB

import bf2
import host
from bf2 import g_debug

# Init. Registers the necessary handlers
def init():
	if g_debug: print 'initializing player connect checking script'
	host.registerHandler('ValidatePlayerNameResponse', onPlayerNameValidated, 1) #Added by Niklas Henriks to validate player Name and ID for update 1.50.

# This is how long we will ban a mis-validated player for, in seconds.
BANTIME = 7 * 24 * 60 * 60

# onPlayerNameValidated is called by the engine when a reply from GameSpy arives, this is done directly when the player connects to the game server.
def onPlayerNameValidated(realNick, oldNick, realPID, oldPID, player):
	if realNick != oldNick:
		message = "Player: %s, real name %s, was kicked and banned for using Name Hacks" % (oldNick, realNick)
	elif realPID != oldPID:
		message = "Player: %s tried to use wrong PlayerID %d (real PID %d); kicked and banned for using PID Hacks" % (oldNick, oldPID, realPID)
	else:
		return
	host.rcon_invoke("admin.banPlayer %d %d" % (player.index, BANTIME))
	host.sgl_sendTextMessage(0, 12, 1, message, 0)
