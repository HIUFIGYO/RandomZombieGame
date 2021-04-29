event_inherited();

if(sprite_index = spr_bursterburst)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	isAttacking = false;
	spriteDead = spr_bursterdead2;
	spriteAttack[0] = spr_bursteratk2;
	ZombieCreateBurst(id, SetStat(7, 9, 11, 14));
	ZombieChangeState(ZombieStateDefault);
}