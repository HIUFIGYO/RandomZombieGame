event_inherited();

if(sprite_index = spr_bursterburst)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	specialActive = false;
	isAttacking = false;
	ZombieCreateBurst(id, SetStat(7, 9, 11, 14));
}