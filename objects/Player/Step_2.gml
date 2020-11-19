//UI Elements
if(spawnedUI)
{
	//damage overlay
	UISetAlpha(overlay, overlayAlpha);
	if(overlayAlpha > 0)
	{
		overlayAlpha -= DeltaTimeSecond();
	}
	
	//health bar
	UIHealthbarSetValue(hpBar, hp/maxHp);
	UITextSet(hpText, string(hp) + "/" + string(maxHp));
	
	//stamina bar
	UIHealthbarSetValue(staminaBar, stamina/maxStamina);
	
	//Ammo text
	var _text = string(mag[currentWeapon]) + "/" + string(ammo[currentWeapon])
	UITextSet(ammoText, _text);
	UISetSize(ammoText, string_width(_text), 20);
	
	//Debug reload timer
	var _text = string(reloadTimer[currentWeapon]);
	UITextSet(reloadText, _text);
	UISetSize(reloadText, string_width(_text), 20);
	
	//Kills
	var _text = "Kills: " + string(kills);
	UITextSet(killsText, _text);
	UISetSize(killsText, string_width(_text), 20);
	
	//money
	var _text = "$" + string(money);
	UITextSet(moneyText, _text);
	UISetSize(moneyText, string_width(_text), 20);
}