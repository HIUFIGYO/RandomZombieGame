///@desc Update UI

if(!spawnedUI)
	exit;
	
var index, _alpha;

//damage overlay
UISetAlpha(overlay, overlayAlpha);
if(overlayAlpha > 0)
{
	overlayAlpha -= DeltaTimeSecond();
}

//danger overlay

var _halfHp = GetMaxHealth(player) / 2;
if(PlayerGetHealth(player) > _halfHp)
	dangerOverlayAlpha = 0;
else
	dangerOverlayAlpha = 1 - (PlayerGetHealth(player) / _halfHp);

UISetAlpha(dangerOverlay, dangerOverlayAlpha);
	
//health bar
UIHealthbarSetValue(hpBar, player.hp/GetMaxHealth(player));
UITextSet(hpText, string(round(player.hp)) + "/" + string(round(GetMaxHealth(player))));
	
//armour bar
UIHealthbarSetValue(armourBar, player.armour/GetMaxArmour(player));
UISetAlpha(armourBar, player.armour > 0);
	
//stamina bar
UIHealthbarSetValue(staminaBar, player.stamina/GetMaxStamina(player));

//buff
UISetAlpha(buffCooldown[0], 0);
UISetAlpha(buffCooldown[1], 0);
UISetAlpha(buffPassive[0], 0);
UISetAlpha(buffPassive[1], 0);
UISetAlpha(buffCooldownP[0], 0);
UISetAlpha(buffCooldownP[1], 0);
for(var i=0; i<2; i++)
{
	index = player.buff[i] == noone ? 0 : player.buff[i] + 1 - Buff.Regeneration;
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
if(IsDead(player))
{
	UISetAlpha(reviveBar, 0.6);
	UIHealthbarSetValue(reviveBar, (player.reviveTime - player.reviveTimer) / player.reviveTime);
	UISetPosition(reviveBar, player.x - 32, player.y - 64);
}

//heal meter
UISetAlpha(healMeter, 0);
if(player.healingItemTimer > 0)
{
	UISetAlpha(healMeter, 0.6);
	var maxTime = DataBaseMedicalGetTimer(player.healingItem);
	UIHealthbarSetValue(healMeter, (maxTime - player.healingItemTimer) / maxTime);
	UISetPosition(healMeter, player.healingID.x - 32, player.healingID.y - 96);
}

//grenades
_alpha = player.grenadeType != noone;
UITextSet(grenadeText, string(player.grenadeAmount));
UISetAlpha(grenadeText, _alpha);
	
//Ammo text
var _text = string(player.mag[player.currentWeapon]) + "/" + string(player.ammo[player.currentWeapon])
UITextSet(ammoText, _text);
UISetAlpha(ammoText, player.weapon[player.currentWeapon] != noone);
	
//reload timer
_alpha = player.reloadTimer[player.currentWeapon] > 0 and player.equipmentCycle == EquipCycle.Weapon;
if(player.weapon[player.currentWeapon] != noone)
{
	var bonus = 1;
	if(CheckBuff(player, Buff.Reload))
		bonus = DataBase.reloadBuffEffect;
	index = floor((player.reloadTimer[player.currentWeapon] / DataBaseGetWeapon(player.weapon[player.currentWeapon], WeapStat.Reload) * bonus) * sprite_get_number(spr_reloadCircle));
}
else
{
	index = 0;
	_alpha = 0;
}
UIImageSetSubImage(reloadImage, index);
UISetAlpha(reloadImage, _alpha);
	
//Kills
var _text = "Kills: " + string(player.kills);
UITextSet(killsText, _text);
UISetSize(killsText, string_width(_text), 20);
	
//money
var _text = "$" + string(round(player.money));
UITextSet(moneyText, _text);
UISetSize(moneyText, string_width(_text), 20);