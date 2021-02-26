///@desc Took Damage

event_inherited();

if(!specialUsed and hp <= maxHp / 2 and !isDead)
{
	xSpeed = 0;
	specialActive = true;
	specialUsed = true;
	sprite_index = spr_bursterburst;
	image_index = 0;
	image_speed = 0.4;
	spriteAttack[0] = spr_bursteratk2;
	spriteWalk = spr_bursterrunning;
	spriteDead = spr_bursterdead2;
	moveSpeed *= 2;
}
