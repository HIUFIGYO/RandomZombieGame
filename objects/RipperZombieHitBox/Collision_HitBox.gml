if(other.pierce <= 0 or ripperID == noone)
	exit;

other.pierce -= 1;

var _damage = other.damage;

if(CheckBuff(other.playerID, Buff.Damage))
	_damage += DataBase.damageBuffMelee;
	
if(other.playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
{
	DebuffApply(ripperID, DeBuff.Ignite, other.playerID);
}

DamageZombie(other.playerID, ripperID, _damage);
GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) /2, false, image_xscale);