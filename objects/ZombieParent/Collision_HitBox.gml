if(isDead or other.pierce <= 0)
	exit;

other.pierce -= 1;

var _damage = other.damage;

if(CheckBuff(other.playerID, Buff.Damage))
	_damage += DataBase.damageBuffMelee;
	
if(other.playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
{
	DebuffApply(id, DeBuff.Ignite, other.playerID);
}

DamageZombie(other.playerID, id, _damage);
audio_play_sound(Sound_MeleeHit, 0 , false);
GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) /2, acid, image_xscale);