var index, offset = 0;

//dead
if(isDead)
{
	draw_sprite_ext(spriteDeadLegs, 0, x, y, image_xscale, 1, 0, leg_color, 1);
	draw_sprite_ext(spriteDeadTorso, torso_index, x, y, image_xscale, 1, 0, torso_color, 1);
	draw_sprite_ext(spriteDeadArms, 0, x, y, image_xscale, 1, 0, arm_color, 1);
	draw_sprite_ext(spriteDeadHead, head_index, x, y, image_xscale, 1, 0, head_color, 1);
	exit;
}

//draw legs
if(isWalking and ySpeed == 0)
{
	draw_sprite_ext(spriteLegs, round(walking_index), x, y, image_xscale, 1, 0, leg_color, 1);
}
else if(ySpeed != 0)
{
	index = 0;
	if(ySpeed > 0)
		index = 1;
	draw_sprite_ext(spriteJumping, index, x, y, image_xscale, 1, 0, leg_color, 1);
}
else if(isCrouching)
{
	offset = crouchOffset;
	draw_sprite_ext(spriteCrouch, 0, x, y, image_xscale, 1, 0, leg_color, 1);
}
else
	draw_sprite_ext(spriteIdle, 0, x, y, image_xscale, 1, 0, leg_color, 1);

draw_sprite_ext(spriteTorso, torso_index, x, y + offset, image_xscale, 1, 0, torso_color, 1);

//draw arms
if(!isMelee and !isThrowing)
{
	switch(equipmentCycle)
	{
		case EquipCycle.Weapon:
			if(weapon[currentWeapon] == noone)
				index = 0;
			else
				index = weapon[currentWeapon] + 1;
			break;
			
		case EquipCycle.Med:
			index = 24 + healingItem - HealingType.Medicine;
			break;
			
		case EquipCycle.Vial:
			index = 27;
			break;
			
		case EquipCycle.Support:
			index = 21;
			if(supportItem == "Flare")
				index = 23;
			draw_sprite_ext(SupportGetSprite(supportItem), !canPlaceSupport, x+supportXOffset * image_xscale, y+supportYOffset, image_xscale, 1, 0, c_white, 0.7);			
			break;
	}
	
	if(CheckVialNegative(id, VialType.Strength))
	{
		if(meleeWeapon == Weapon.Knife)
			index = 1;
		else if(meleeWeapon == Weapon.Knife2)
			index = 5;
		else if(meleeWeapon == Weapon.Knife3)
			index = 9;
		else if(meleeWeapon == Weapon.Knife4)
			index = 17;
		else
			index = 0;
	}
	
	draw_sprite_ext(spriteGuns, index, x, y + offset, image_xscale, 1, 0, c_white, 1);
	draw_sprite_ext(spriteArms, index, x, y + offset, image_xscale, 1, 0, arm_color, 1);
}

//draw body and head
draw_sprite_ext(spriteHead, head_index, x, y + offset, image_xscale, 1, 0, head_color, 1);
draw_sprite_ext(spriteCosmetic, cosmetic_index, x, y + offset, image_xscale, 1, 0, c_white, 1);

if(isMelee)
{
	index = 0;
	if(meleeWeapon == Weapon.Knife2)
		index = 1;
	else if(meleeWeapon == Weapon.Knife3)
		index = 2;
	else if(meleeWeapon == Weapon.Knife4)
		index = 3;
	draw_sprite_ext(spriteMelee[index], round(meleeSubImage), x, y + offset, image_xscale, 1, 0, arm_color, 1);
	draw_sprite_ext(spriteMelee[4 + index], round(meleeSubImage), x, y + offset, image_xscale, 1, 0, c_white, 1);
}

if(isThrowing)
{
	draw_sprite_ext(spriteThrow, throwSubImage, x, y + offset, image_xscale, 1, 0, arm_color, 1);
}