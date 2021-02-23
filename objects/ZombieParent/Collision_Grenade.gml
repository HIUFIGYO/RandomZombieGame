if(isDead)
	exit;
	
var _damage = DataBase.grenadeImpact;

if other.impactDamage = true and ((!other.xSpeed = 0) or (!other.ySpeed = 0))
{
	DamageZombie(other.playerID, id, _damage);
	GameSprayBlood(5 , x, y, false, image_xscale);
	other.impactDamage = false
}