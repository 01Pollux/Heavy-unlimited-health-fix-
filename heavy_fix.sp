#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	author		= "01Pollux."
};

int m_bIsDraining;
public void OnPluginStart() {
	m_bIsDraining = FindSendPropInfo("CTFPlayer", "m_iPlayerSkinOverride") + 0x34;
	HookEvent("player_spawn", Post_PlayerSpawn, EventHookMode_Post);
}

public void Post_PlayerSpawn(Event hEvent, const char[] nName, bool bBroadCast) {
	int player = GetClientOfUserId(hEvent.GetInt("userid"));
	if(IsClientInGame(player) && IsPlayerAlive(player)) {
		DisableHealthDrain(player);
	}
}

void DisableHealthDrain(int player) {
	SetEntData(player, m_bIsDraining, 0);
}
