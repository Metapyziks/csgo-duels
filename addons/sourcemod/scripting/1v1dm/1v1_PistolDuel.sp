void ChangePistolDuel(int client)
{
	if(b_PistolDuelEnabled[client])
	{
		b_PistolDuelEnabled[client] = false;
		SetClientCookie(client, g_PistolDuel, "0");
	} else {
		b_PistolDuelEnabled[client] = true;
		SetClientCookie(client, g_PistolDuel, "1");
	}

	ShowMainMenu(client);
}

void GivePistolDuelWeapons(int client)
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

	bool isStarterPistol =
		StrEqual(g_SecondaryWeapon[client], "weapon_hkp2000") ||
		StrEqual(g_SecondaryWeapon[client], "weapon_usp_silencer") ||
		StrEqual(g_SecondaryWeapon[client], "weapon_glock");

	if(!StrEqual(g_SecondaryWeapon[client], ""))
		GivePlayerItem(client, g_SecondaryWeapon[client]);
	
	int weapon3 = GetPlayerWeaponSlot(client, CS_SLOT_KNIFE);
	if(weapon3 > 0 && IsValidEntity(weapon3)) {
		RemovePlayerItem(client, weapon3);
		RemoveEdict(weapon3);
	}
	GivePlayerItem(client, "weapon_knife");

	SetEntProp(client, Prop_Send, "m_ArmorValue", isStarterPistol ? 100 : 0, 10);
	SetEntProp(client, Prop_Send, "m_bHasHelmet", 0);
}