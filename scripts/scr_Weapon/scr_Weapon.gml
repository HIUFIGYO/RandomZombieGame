enum WeapStat
{
	Type,
	Tier,
	Damage,
	FireRate,
	Mag,
	Ammo,
	Accuracy,
	Range,
	Reload,
	BulletSpeed,
	xOffset,
	yOffset,
	BulletImage,
	Auto,
	Burst,
	Pierce,
	Sound,
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

enum Tier
{
	One,
	Two,
	Three,
	Four,
	Five
}

///@function CanCancelReload(weapon)

function CanCancelReload(_weapon)
{
	return (_weapon == Weapon.Shotgun or _weapon == Weapon.Shotgun3 or _weapon == Weapon.Pistol3);
}

///@function ExplosionGetDamage(explosionType)

function ExplosionGetDamage(_explosionType)
{
	return DataBase.explosionDamage[_explosionType];
}

///@function ExplosionGetSize(explosionType)

function ExplosionGetSize(_explosionType)
{
	return DataBase.explosionSize[_explosionType];
}

///@function ExplosionGetPierce(explosionType)

function ExplosionGetPierce(_explosionType)
{
	return DataBase.explosionPierce[_explosionType];
}

///@function GrenadeGetFuseTime(grenadeType)

function GrenadeGetFuseTime(_grenadeType)
{
	return DataBase.grenadeFuseTime[_grenadeType - GrenadeType.Grenade];
}

///@function GrenadeGetImpact(grenadeType)

function GrenadeGetImpact(_grenadeType)
{
	return DataBase.grenadeImpact[_grenadeType - GrenadeType.Grenade];
}

///@function ExplosionPush(id, explosion, force)

function ExplosionPush(_id, _explosion, _force)
{
	var velocityX = _id.x - _explosion.x,
		velocityY = (_id.y - _explosion.y) - 10;
		
	var _length = sqrt(sqr(velocityX) + sqr(velocityY));
	
	if(_length != 0)
	{
		velocityX /= _length;
		velocityY /= _length;
	}
	
	_id.xSpeed = velocityX * _force*_force;
	_id.ySpeed = velocityY * _force * 2;
}

///@function TeslaDealDamage()

function TeslaDealDamage()
{
	var hits = ds_list_create();
	
	var count = collision_circle_list(x, y, teslaRadius, ZombieParent, false, true, hits, false);
	
	for(var i=0; i<count; i++)
	{
		DamageZombie(playerID, hits[| i], DataBaseGetWeapon(Weapon.Tesla, WeapStat.Damage) / 2, false);
		//CreateTelsaZappyEffect();
	}
	
	ds_list_destroy(hits);
}
