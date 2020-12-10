if(isDead) { exit; }

var _damage = ExplosionGetDamage(other.grenadeType);

if(CheckBuff(other.playerID, Buff.Damage) and _damage > 0)
	_damage += DataBase.damageBuffExplosive;
	
DamageZombie(other.playerID, id, _damage);

if(_damage > 0)
	GameSprayBlood(other.x, other.y, acid, image_xscale);