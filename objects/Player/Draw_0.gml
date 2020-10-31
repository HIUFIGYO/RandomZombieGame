var index;

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
else
	draw_sprite_ext(idle, 0, x, y, image_xscale, 1, 0, leg_color, 1);

draw_sprite_ext(torso, torso_index, x, y, image_xscale, 1, 0, torso_color, 1);
if(weapon[currentWeapon] == noone)
	index = 0;
else
	index = weapon[currentWeapon] + 1;
draw_sprite_ext(guns, index, x, y, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(arms, index, x, y, image_xscale, 1, 0, arm_color, 1);
draw_sprite_ext(head, head_index, x, y, image_xscale, 1, 0, head_color, 1);
draw_sprite_ext(cosmetic, cosmetic_index, x, y, image_xscale, 1, 0, c_white, 1);