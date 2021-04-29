///@desc Took Damage

event_inherited();

if(!specialUsed and hp <= maxHp / 2 and !isDead)
{
	specialUsed = true;
	xSpeed = 0;
	sprite_index = spr_bursterburst;
	image_index = 0;
	image_speed = 0.4;
	spriteWalk = spr_bursterrunning;
	moveSpeed *= 2;
	ZombieChangeState(ZombieStateVoid);
}
