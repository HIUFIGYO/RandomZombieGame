var index, offset = 0;

//dead
if(isDead)
{
	draw_sprite_ext(dead, 0, x, y, image_xscale, 1, 0, c_white, 1);
	exit;
}

//draw legs
if(isWalking and isGrounded)
{
	draw_sprite_ext(legs, round(walking_index), x, y, image_xscale, 1, 0, leg_color, 1);
}
else if(!isGrounded)
{
	index = 0;
	if(ySpeed > 0)
		index = 1;
	draw_sprite_ext(jumping, index, x, y, image_xscale, 1, 0, leg_color, 1);
}
else if(isCrouching)
{
	offset = crouchOffset;
	draw_sprite_ext(crouch, 0, x, y, image_xscale, 1, 0, leg_color, 1);
}
else
	draw_sprite_ext(idle, 0, x, y, image_xscale, 1, 0, leg_color, 1);

draw_sprite_ext(torso, torso_index, x, y + offset, image_xscale, 1, 0, torso_color, 1);

//draw arms
if(!isMelee and !isThrowing)
{
	if(weapon[currentWeapon] == noone)
		index = 0;
	else
		index = weapon[currentWeapon] + 1;
	draw_sprite_ext(guns, index, x, y + offset, image_xscale, 1, 0, c_white, 1);
	draw_sprite_ext(arms, index, x, y + offset, image_xscale, 1, 0, arm_color, 1);
}

//draw body and head
draw_sprite_ext(head, head_index, x, y + offset, image_xscale, 1, 0, head_color, 1);
draw_sprite_ext(cosmetic, cosmetic_index, x, y + offset, image_xscale, 1, 0, c_white, 1);

if(isMelee)
{
	index = 0;
	if(meleeWeapon == Weapon.Knife2)
		index = 1;
	else if(meleeWeapon == Weapon.Knife3)
		index = 2;
	else if(meleeWeapon == Weapon.Knife4)
		index = 3;
	draw_sprite_ext(melee[index], round(meleeSubImage), x, y + offset, image_xscale, 1, 0, arm_color, 1);
}

if(isThrowing)
{
	draw_sprite_ext(throwSprite, throwSubImage, x, y + offset, image_xscale, 1, 0, arm_color, 1);
}