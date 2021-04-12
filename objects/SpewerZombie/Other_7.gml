event_inherited();

if(sprite_index = spr_spewershoot)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	specialActive = false;
	isAttacking = false;
	specialCooldown = cooldownTime;
	ZombieCreateProjectile(SpewerProjectile);
}