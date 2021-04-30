event_inherited();

if(sprite_index == spr_twitcherevade)
{
	sprite_index = spriteIdle;
	dodgeUsed = false;
	isAttacking = false;
	dodgeCooldown = dodgeCooldownTime;
	ZombieChangeState(ZombieStateTwitcher);
}