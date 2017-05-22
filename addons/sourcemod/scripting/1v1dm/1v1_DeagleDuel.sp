void ChangeDeagleDuel(int client)
{
	if(b_DeagleDuelEnabled[client])
	{
		b_DeagleDuelEnabled[client] = false;
		SetClientCookie(client, g_DeagleDuel, "0");
	} else {
		b_DeagleDuelEnabled[client] = true;
		SetClientCookie(client, g_DeagleDuel, "1");
	}

	ShowMainMenu(client);
}

void GiveDeagleDuelWeapons(int client)
{
	RemoveGrenade(client);
	
	int weapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
	if(weapon > 0 && IsValidEntity(weapon)) {
		RemovePlayerItem(client, weapon);
		RemoveEdict(weapon);
	}
	
	int weapon2 = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
	if(weapon2 > 0 && IsValidEntity(weapon2)) {
		RemovePlayerItem(client, weapon2);
		RemoveEdict(weapon2);
	}
	GivePlayerItem(client, "weapon_deagle");
	
	int weapon3 = GetPlayerWeaponSlot(client, CS_SLOT_KNIFE);
	if(weapon3 > 0 && IsValidEntity(weapon3)) {
		RemovePlayerItem(client, weapon3);
		RemoveEdict(weapon3);
	}
	GivePlayerItem(client, "weapon_knife");
}