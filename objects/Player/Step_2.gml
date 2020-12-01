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
	
	//armour bar
	UIHealthbarSetValue(armourBar, armour/maxArmour);
	UISetAlpha(armourBar, armour > 0);
	
	//stamina bar
	UIHealthbarSetValue(staminaBar, stamina/maxStamina);
	
	//revive bar
	UISetAlpha(reviveBar, isDead);
	if(isDead)
	{
		UIHealthbarSetValue(reviveBar, (reviveTime - reviveTimer) / reviveTime);
		UISetPosition(reviveBar, x - 32, y - 64);
	}
	
	//Ammo text
	var _text = string(mag[currentWeapon]) + "/" + string(ammo[currentWeapon])
	UITextSet(ammoText, _text);
	UISetSize(ammoText, string_width(_text), 20);
	
	//reload timer
	var index = floor(reloadTimer[currentWeapon] / DataWeapon(weapon[currentWeapon], WeapStat.Reload) * sprite_get_number(spr_reloadCircle));
	UIImageSetSubImage(reloadImage, index);
	UISetAlpha(reloadImage, reloadTimer[currentWeapon] > 0);
	
	//Kills
	var _text = "Kills: " + string(kills);
	UITextSet(killsText, _text);
	UISetSize(killsText, string_width(_text), 20);
	
	//money
	var _text = "$" + string(money);
	UITextSet(moneyText, _text);
	UISetSize(moneyText, string_width(_text), 20);
}