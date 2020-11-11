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

///@function DamagePlayer(player, damage)

function DamagePlayer(_player, _damage)
{
	_player.hp -= _damage;
	if(_player.hp < 0)
	{
		_player.hp = 0;
		_player.isDead = true;
	}
	repeat(_damage)
	{
		var inst = instance_create_layer(_player.x, _player.y - 32, GameManager.layerCorpse, Blood);
		inst.xSpeed = -10 + irandom(20);
		inst.ySpeed = -10 - irandom(10);
	}
}

///@function RevivePlayer(player, startHp)

function RevivePlayer(_player, _startHp)
{
	_player.isDead = false;
	_player.hp = _startHp;
}