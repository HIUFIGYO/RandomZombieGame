enum Weapon
{
	Knife,
	Pistol,
	Rifle,
	Shotgun,
	Knife2,
	Pistol2,
	Rifle2,
	Shotgun2,
	Knife3,
	Pistol3,
	Rifle3,
	Shotgun3,
	Flame,
	Rocket,
	Tesla,
	Acid,
	Knife4,
	Purple,
	Drainer,
	BHDarker,
	count
}

enum WeapStat
{
	Type,
	Damage,
	FireRate,
	Mag,
	Ammo,
	Accuracy,
	Range,
	Reload,
	Price,
	BulletSpeed,
	xOffset,
	yOffset,
	BulletImage,
	Auto,
	Burst,
	Pierce,
	count
}

enum WeapType
{
	Melee,
	SideArm,
	Primary
}

enum BulletImage
{
	Pistol,
	Rifle,
	Shotgun,
	Rocket,
	Acid,
	Purple,
	Drainer,
	Particle
}

///@ function DataWeapon(weapon, stat)

function DataWeapon(weapon, stat)
{
	return DataBase.weapon[# stat, weapon];
}

///@function CreateBullet(id, x, y, weapon, flip, isCrouching)

function CreateBullet(_id, xx, yy, _weapon, flip, crouch)
{
	repeat(DataWeapon(_weapon, WeapStat.Burst))
	{
		var xoff = DataWeapon(_weapon, WeapStat.xOffset) * flip;
		var yoff = DataWeapon(_weapon, WeapStat.yOffset);
		var inst = instance_create_layer(xx + xoff, yy - yoff, GameManager.layerObject, Bullet);
		inst.playerID = _id;
		inst.weapon = _weapon;
		inst.spd = DataWeapon(_weapon, WeapStat.BulletSpeed);
		inst.rangeTimer = DataWeapon(_weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
		inst.pierce = DataWeapon(_weapon, WeapStat.Pierce);
		inst.image_xscale = flip;
		inst.image_index = DataWeapon(_weapon, WeapStat.BulletImage);
		
		var accuracy = DataWeapon(_weapon, WeapStat.Accuracy);
		if(crouch)
			accuracy *= 1.05;
		accuracy = clamp(accuracy, 0, 0.97);
		var bulletAngle = irandom((1 - accuracy) * 90);
		inst.xSpeed = cos(bulletAngle * pi / 180) * flip;
		inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
	}
}

///@function WeaponReload(player, weapon)

function WeaponReload(_player, _weapon)
{
	if(_player.reloadTimer[_player.currentWeapon] > 0 or ammo[_player.currentWeapon] <= 0)
		return;
		
	var additionalTime = 0;
	if(CanCancelReload(_weapon))
	{
		_player.reloadSingleShot[_player.currentWeapon] = 1;
		if(DataWeapon(_weapon, WeapStat.Mag) <= _player.ammo[_player.currentWeapon])
			additionalTime = DataWeapon(_weapon, WeapStat.Mag) - _player.mag[_player.currentWeapon] - 1;
		else
			additionalTime = _player.ammo[_player.currentWeapon] - 1;
	}
	var bonus = CheckBuff(_player, Buff.Reload);
	_player.reloadTimer[_player.currentWeapon] = max(1, (DataWeapon(_weapon, WeapStat.Reload) + additionalTime) - (bonus * DataBase.reloadBuffEffect));
}

///@function CanCancelReload(weapon)

function CanCancelReload(_weapon)
{
	return (_weapon == Weapon.Shotgun or _weapon == Weapon.Shotgun3 or _weapon == Weapon.Pistol3);
}

///@function CreateHitBox(playerID, x, y, sprite, subImage, damage)

function CreateHitBox(_player, _x, _y, _sprite, _subImage, _damage)
{
	var inst = instance_create_layer(_x, _y, UIController.layerUI, HitBox);
	inst.playerID = _player;
	inst.sprite_index = _sprite;
	inst.image_speed = 0;
	inst.image_index = _subImage;
	inst.damage = _damage;
	return inst;
}