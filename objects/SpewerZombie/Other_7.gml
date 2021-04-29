event_inherited();

if(sprite_index = spr_spewershoot)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	isAttacking = false;
	specialCooldown = cooldownTime;
	ZombieCreateProjectile(SpewerProjectile);
	ZombieChangeState(ZombieStateDefault);
}