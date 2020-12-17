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
var index = player.buff[0] == noone ? 0 : player.buff[0] + 1;
UIImageSetSubImage(buffIcon, index);

var maxCoolDDown = 1;
index = player.buffCooldown[0];
if(player.buff[0] == Buff.Demo)
	maxCoolDDown = DataBase.demoBuffCooldown;
else if(player.buff[0] == Buff.Resistance)
	maxCoolDDown = DataBase.resistBuffCooldown;
else
	index = 0;
index = (index / maxCoolDDown) * sprite_get_number(spr_buffDurationRing);
UIImageSetSubImage(buffCooldown, index);
	
//revive bar
UISetAlpha(reviveBar, player.isDead);
if(player.isDead)
{
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