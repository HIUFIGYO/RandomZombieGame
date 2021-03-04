///@function SupportGetSprite(support)

function SupportGetSprite(_support)
{
	return DataBase.supportSprite[_support - SupportType.Barricade];
}

///@function SupportGetObject(support)

function SupportGetObject(_support)
{
	return DataBase.supportObject[_support - SupportType.Barricade];
}

///@function TurretShoot(turret)

function TurretShoot(_turret)
{
	var inst = instance_create_layer(_turret.x + sprite_get_width(_turret.sprite_index) * _turret.image_xscale, _turret.y - _turret.yoffSet, GameManager.layerObject, Bullet);
	inst.playerID = _turret.playerID;
	inst.weapon = Weapon.Rifle;
	inst.spd = 64;
	inst.rangeTimer = DataWeapon(inst.weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
	inst.pierce = 1;
	inst.ignoreBuffs = true;
	inst.image_xscale = _turret.image_xscale;
	inst.image_index = DataWeapon(inst.weapon, WeapStat.BulletImage);

	var bulletAngle = irandom((1 - _turret.accuracy) * 90);
	inst.xSpeed = cos(bulletAngle * pi / 180) * _turret.image_xscale;
	inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
}

