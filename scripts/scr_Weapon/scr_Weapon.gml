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

///@function ExplosionGetDamage(grenadeType)

function ExplosionGetDamage(_grenadeType)
{
	return DataBase.explosionDamage[_grenadeType];
}

///@function ExplosionGetSize(explosion)

function ExplosionGetSize(_explosionType)
{
	return DataBase.explosionSize[_explosionType];
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