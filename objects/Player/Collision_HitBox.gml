if(isDead or other.pierce <= 0 or !CheckVialNegative(id, VialType.Mimicry)or other.playerID == id)
	exit;

other.pierce -= 1;

var _damage = other.damage;

if(CheckBuff(other.playerID, Buff.Damage))
	_damage += DataBase.damageBuffMelee;
	
if(other.playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
{
	DebuffApply(id, DeBuff.Ignite);
}

DamagePlayer(id, _damage, "FriendlyFire", other);
GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) /2, false, image_xscale);