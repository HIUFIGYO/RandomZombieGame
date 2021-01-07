if(isDead or other.pierce <= 0)
	exit;

other.pierce -= 1;

var _damage = other.damage;

if(CheckBuff(other.playerID, Buff.Damage))
	_damage += DataBase.damageBuffMelee;

DamageZombie(other.playerID, id, _damage);
GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) /2, acid, image_xscale);