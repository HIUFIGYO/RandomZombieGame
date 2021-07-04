event_inherited();

if(sprite_index == spriteIdle and hp <= maxHp / 2)
	image_index = 1;
	
if(startSpecial)
{
	startSpecial = false;
	specialUsed = true;
	xSpeed = 0;
	sprite_index = spr_bursterburst;
	image_index = 0;
	image_speed = 0.4;
	spriteWalk = spr_bursterrunning;
	moveSpeed *= 2;
	ZombieChangeState(ZombieStateVoid);
}