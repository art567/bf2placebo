# team autobalance system

import bf2
import host
from bf2 import g_debug



def init():
	if g_debug: print 'initializing autobalance script'
	
	host.registerHandler('PlayerConnect', onPlayerConnect, 1)	
	host.registerHandler('PlayerDeath', onPlayerDeath)
	host.registerHandler('PlayerChangeTeams', onPlayerChangeTeams)



def onPlayerConnect(p):
	
	# dont teamswitch alive players, or they will have the wrong teams kit 
	if p.isAlive(): return
	
	# place player on the team with least players
	team1 = 0
	team2 = 0
	for tp in bf2.playerManager.getPlayers():
		if tp != p:
			if tp.getTeam() == 1: team1 += 1
			else: team2 += 1	
			
	team2 = team2 * bf2.serverSettings.getTeamRatioPercent() / 100.0		
	if team2 > team1:
		p.setTeam(1)
	else:
		p.setTeam(2)


		
def onPlayerDeath(p, vehicle):		
	
	if not bf2.serverSettings.getAutoBalanceTeam(): return
	
	if p.isSquadLeader(): return		
	if p.isCommander(): return	
	
	if (host.ss_getParam('gameMode') == "gpm_coop") and p.isAIPlayer():
		return
	
	# dont use autobalance when its suicide/changes team
	if p.getSuicide(): 
		p.setSuicide(0)
		return
	
	aiPlayerBalance = 0
	team1 = 0
	team2 = 0
	for tp in bf2.playerManager.getPlayers():	
		if tp.getTeam() == 1:
			team1 += 1
		else:
			team2 += 1
		if tp.isAIPlayer():
			aiPlayerBalance += 1
		else:
			aiPlayerBalance -= 1					
	
	if host.sgl_getIsAIGame():
		if not (host.ss_getParam('gameMode') == "gpm_coop"):
			if not (aiPlayerBalance < 0):		
				if not p.isAIPlayer():
					return
	
	team2 = team2 * bf2.serverSettings.getTeamRatioPercent() / 100.0

	if (p.getTeam() == 1):
		if (team2+1) < team1:
			p.setTeam(2)			
	elif (p.getTeam() == 2):
		if (team1+1) < team2:
			p.setTeam(1)			


		
def onPlayerChangeTeams(p, humanHasSpawned):
	
	if not bf2.serverSettings.getAutoBalanceTeam(): return

	# dont teamswitch alive players, or they will have the wrong teams kit 
	if p.isAlive(): return
	
	if host.sgl_getIsAIGame() and not (host.ss_getParam('gameMode') == "gpm_coop"):
		if humanHasSpawned: return
		if p.isAIPlayer(): return
			
		# handling aiplayer team change autobalance when round not started
		team = p.getTeam()	
		aiplayer = 0	
	
		for tp in bf2.playerManager.getPlayers():		
			if aiplayer == 0 and tp.getTeam() == team and tp.isAIPlayer(): 
				aiplayer = tp
				break
		
		if aiplayer: 
			if p.getTeam() == 1: aiplayer.setTeam(2)
			else: aiplayer.setTeam(1)
									
	else:
		# checking to see if player is allowed to change teams
		team1 = 0
		team2 = 0
		for tp in bf2.playerManager.getPlayers():	
			if tp.getTeam() == 1: team1 += 1
			else: team2 += 1
		if abs(team1 - team2) > 1:
			if p.getTeam() == 1: p.setTeam(2)
			else: p.setTeam(1)
	
	
		
