event_inherited();

if(sprite_index = spr_bursterburst)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	specialActive = false;
	ZombieCreateBurst(id, SetStat(5, 6, 8, 12));
}