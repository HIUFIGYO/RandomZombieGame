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

///@function CreateBullet(x, y, weapon, count, dir)

function CreateBullet(_id, xx, yy, _weapon, flip, crouch)
{
	repeat(DataWeapon(_weapon, WeapStat.Burst))
	{
		var xoff = DataWeapon(_weapon, WeapStat.xOffset) * flip;
		var yoff = DataWeapon(_weapon, WeapStat.yOffset);
		var inst = instance_create_layer(xx + xoff, yy - yoff, GameManager.layerObject, Bullet);
		inst.playerID = _id;
		inst.weapon = _weapon;
		inst.rangeTimer = DataWeapon(_weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
		inst.image_xscale = flip;
		inst.image_index = DataWeapon(_weapon, WeapStat.BulletImage);
		
		var accuracy = DataWeapon(_weapon, WeapStat.Accuracy);
		if(crouch)
			accuracy *= 1.25;
		accuracy = clamp(accuracy, 0, 1);
		var bulletAngle = irandom((1 - accuracy) * 90);
		inst.xSpeed = cos(bulletAngle * pi / 180) * flip;
		inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
	}
}