///@desc Update UI

if(!spawnedUI)
	exit;

//damage overlay
UISetAlpha(overlay, overlayAlpha);
if(overlayAlpha > 0)
{
	overlayAlpha -= DeltaTimeSecond();
}
	
//health bar
UIHealthbarSetValue(hpBar, player.hp/GetMaxHealth(player));
UITextSet(hpText, string(player.hp) + "/" + string(GetMaxHealth(player)));
	
//armour bar
UIHealthbarSetValue(armourBar, player.armour/GetMaxArmour(player));
UISetAlpha(armourBar, player.armour > 0);
	
//stamina bar
UIHealthbarSetValue(staminaBar, player.stamina/GetMaxStamina(player));

//buff
var index;
UISetAlpha(buffCooldown[0], 0);
UISetAlpha(buffCooldown[1], 0);
UISetAlpha(buffPassive[0], 0);
UISetAlpha(buffPassive[1], 0);
UISetAlpha(buffCooldownP[0], 0);
UISetAlpha(buffCooldownP[1], 0);
for(var i=0; i<2; i++)
{
	var index = player.buff[i] == noone ? 0 : player.buff[i] + 1;
	UIImageSetSubImage(buffIcon[i], index);
	
	if(player.buff[i] == Buff.Demo)
	{
		if(player.buffCooldown[i] > 0)
		{
			UISetAlpha(buffCooldown[i], 1);
			UISetAlpha(buffPassive[i], 1);
			UISetAlpha(buffCooldownP[i], 1);
			UIImageSetSubImage(buffCooldown[i], 0);
			UIImageSetSubImage(buffPassive[i], 0);
			index = (player.buffCooldown[i] / DataBase.demoBuffCooldown) * sprite_get_number(spr_buffDurationRing);
			UIImageSetSubImage(buffCooldownP[i], index);
		}
	}
	
	if(player.buff[i] == Buff.Resistance)
	{
		if(player.buffCooldown[i] > 0)
		{
			UISetAlpha(buffCooldown[i], 1);
			index = (player.buffCooldown[i] / DataBase.resistBuffCooldown) * sprite_get_number(spr_buffDurationRing);
			UIImageSetSubImage(buffCooldown[i], index);
		}
		
		if(player.damageResistanceTimer > 0)
		{
			UISetAlpha(buffPassive[i], 1);
			UISetAlpha(buffCooldownP[i], 1);
			UIImageSetSubImage(buffPassive[i], 1);
			index = (player.damageResistanceTimer / DataBase.resistBuffEffectDuration) * sprite_get_number(spr_buffDurationRing);
			UIImageSetSubImage(buffCooldownP[i], index);
		}
	}
}
	
//revive bar
UISetAlpha(reviveBar, 0);
if(player.isDead)
{
	UISetAlpha(reviveBar, 0.6);
	UIHealthbarSetValue(reviveBar, (player.reviveTime - player.reviveTimer) / player.reviveTime);
	UISetPosition(reviveBar, player.x - 32, player.y - 64);
}

//grenades
UITextSet(grenadeText, " x " + string(player.grenadeAmount));
	
//Ammo text
var _text = string(player.mag[player.currentWeapon]) + "/" + string(player.ammo[player.currentWeapon])
UITextSet(ammoText, _text);
UISetSize(ammoText, string_width(_text), 20);
	
//reload timer
var index = floor(player.reloadTimer[player.currentWeapon] / DataWeapon(player.weapon[player.currentWeapon], WeapStat.Reload) * sprite_get_number(spr_reloadCircle));
UIImageSetSubImage(reloadImage, index);
UISetAlpha(reloadImage, player.reloadTimer[player.currentWeapon] > 0);
	
//Kills
var _text = "Kills: " + string(player.kills);
UITextSet(killsText, _text);
UISetSize(killsText, string_width(_text), 20);
	
//money
var _text = "$" + string(player.money);
UITextSet(moneyText, _text);
UISetSize(moneyText, string_width(_text), 20);