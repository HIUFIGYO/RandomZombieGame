if(isDead) { exit; }

var _damage = ExplosionGetDamage(other.grenadeType);
DamageZombie(other.playerID, id, _damage);

if(_damage > 0)
	GameSprayBlood(other.x, other.y, acid, image_xscale);