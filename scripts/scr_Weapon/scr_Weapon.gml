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
	count
}

enum WeapType
{
	Melee,
	SideArm,
	Primary
}

///@ function DataWeapon(weapon, stat)

function DataWeapon(weapon, stat)
{
	return DataBase.weapon[# stat, weapon];
}

///@function CreateBullet(x, y, weapon, count, dir)

function CreateBullet(xx, yy, _weapon, _count, dir)
{
	repeat(_count)
	{
		var xoff = DataWeapon(_weapon, WeapStat.xOffset) * dir;
		var yoff = DataWeapon(_weapon, WeapStat.yOffset);
		var inst = instance_create_layer(xx + xoff, yy - yoff, "Instances", Bullet);
		inst.weapon = _weapon;
		inst.rangeTimer = DataWeapon(_weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
		inst.xSpeed = dir;
	}
}