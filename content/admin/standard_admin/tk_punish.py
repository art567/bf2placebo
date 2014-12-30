# tk punish system
import bf2
import host
from bf2 import g_debug
from bf2.stats.constants import *

TK_PUNISH_TIME = 20
TK_PUNISH_COMMANDID = 100
TK_FORGIVE_COMMANDID = 101

hasPendingTks = {}
updateTimer = None



class TkData:
	def __init__(self):
		self.punished = 0
		self.pending = []
		self.lastTKedBy = None



def init():
	if g_debug: print "initializing tk-punish script"

	host.registerHandler('PlayerConnect', onPlayerConnect, 1)
	host.registerHandler('PlayerKilled', onPlayerKilled)
	host.registerHandler('ClientCommand', onClientCommand)

	# Connect already connected players if reinitializing
	for p in bf2.playerManager.getPlayers():
		onPlayerConnect(p)
	
	checkEnable()



def checkEnable():
	global updateTimer
	
	if not bf2.serverSettings.getTKPunishEnabled():
		if updateTimer:
			updateTimer.destroy()
			updateTimer = None
		return False
	else:
		if not updateTimer:
			updateTimer = bf2.Timer(onUpdate, 10, 1)
			updateTimer.setRecurring(10)
			
		return True
	

def onUpdate(data):
	if not checkEnable(): return
	global hasPendingTks

	currentTime = host.timer_getWallTime()

	newPending = {}
	for attacker in hasPendingTks.iterkeys():
		newList = []

		for tk in attacker.tkData.pending:
			tkDate = tk[0]
			tkVictim = tk[1]

			# check if there is a pending TK with time expired
			if tkDate + TK_PUNISH_TIME < currentTime:
				if bf2.serverSettings.getTKPunishByDefault():
					attacker.tkData.punished += 1
					checkPunishLimit(attacker)

				# remove player from global list, if it was the last tk
				if len(attacker.tkData.pending) == 1:
					pass
				else:
					newPending[attacker] = 1
			
			else:
				newList += [tk]
				newPending[attacker] = 1
		
		attacker.tkData.pending = newList

	hasPendingTks = newPending
	

						
def checkPunishLimit(player):
	if player.tkData.punished >= bf2.serverSettings.getTKNumPunishToKick():
		result = host.rcon_invoke("admin.banPlayerKey " + str(player.index) + " Round")
		
	


# event actions	

def onPlayerConnect(player):
	player.tkData = TkData()

def onClientCommand(command, issuer, args):
	if not checkEnable(): return
	
	if command == TK_PUNISH_COMMANDID:
		executePunishAction(issuer, True)
	elif command == TK_FORGIVE_COMMANDID:
		executePunishAction(issuer, False)

def onPlayerKilled(victim, attacker, weapon, assists, object):
#    decho( "%s : weapon" % weapon, 5)
#    decho( "%s : object" % object, 5)
    if not checkEnable(): return

    if not victim or not attacker or victim == attacker or victim.getTeam() != attacker.getTeam(): return
	
	# no teamkills from wrecks
    if object != None and object.getIsWreck():
		return
		
	# no teamkills from artillery
    if weapon:
        attackerVehicle = bf2.objectManager.getRootParent(weapon)
        if attackerVehicle.isPlayerControlObject and attackerVehicle.getIsRemoteControlled():
            return

#HF Start
    #Part 1
	if weapon == None and object != None:
		victimVehicle = victim.getVehicle()
		victimRootVehicle = bf2.objectManager.getRootParent(victimVehicle)
		victimVehicleType = getVehicleType(victimRootVehicle.templateName)
		attackerVehicle = attacker.getVehicle()
		attackerRootVehicle = bf2.objectManager.getRootParent(attackerVehicle)
		attackerVehicleType = getVehicleType(attackerRootVehicle.templateName)
		#No tk on roadkill from airplane and helo
		if attackerVehicleType == VEHICLE_TYPE_AVIATOR and victimVehicleType == VEHICLE_TYPE_SOLDIER:
			return
#HF Stop
		
	# ok, we have a teamkill
	currentTime = host.timer_getWallTime()
	attacker.tkData.pending += [(currentTime, victim)]
	hasPendingTks[attacker] = 1
		
	victim.tkData.lastTKedBy = attacker # can only punish / forgive the last TK'er
	
	bf2.gameLogic.sendClientCommand(victim.index, 100, (2, victim.index, attacker.index, TK_PUNISH_TIME))



def executePunishAction(victim, punish):
	if not checkEnable() or not victim or not victim.isValid(): return
	attacker = victim.tkData.lastTKedBy
	if attacker == None or not attacker.isValid(): return

	global hasPendingTks

	currentTime = host.timer_getWallTime()
	
	newList = []
	for tk in attacker.tkData.pending:
		tkDate = tk[0]
		tkVictim = tk[1]
		
		# if the attacker had a pending tk, and time has not run out
		if tkVictim == victim and tkDate + TK_PUNISH_TIME > currentTime:
			if punish:
				attacker.tkData.punished += 1
				bf2.gameLogic.sendClientCommand(-1, 100, (0, victim.index, attacker.index)) # 100 = tkpunish event, 0 = punish
			else:
				bf2.gameLogic.sendClientCommand(-1, 100, (1, victim.index, attacker.index)) # 100 = tkpunish event, 1 = forgive
		else:
			newList += [tk]
			
	attacker.tkData.pending = newList
	
	if len(attacker.tkData.pending) == 0:
		del hasPendingTks[attacker]
	
	checkPunishLimit(attacker)
