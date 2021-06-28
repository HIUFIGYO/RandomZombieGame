if(isDead or other.pierce <= 0 or other.playerID == id or !CheckVialNegative(id, VialType.Mimicry) or GameManager.gamePaused)
	return;

other.pierce -= 1;

var _damage = other.damage;

if(CheckBuff(other.playerID, Buff.Damage))
	_damage += DataBase.damageBuffMelee;
	
if(other.playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
{
	DebuffApply(id, DeBuff.Ignite);
}

DamagePlayer(id, _damage * SetStat(0.5, 1, 1.5, 2), "FriendlyFire", other.playerID.name);
GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) /2, false, image_xscale);