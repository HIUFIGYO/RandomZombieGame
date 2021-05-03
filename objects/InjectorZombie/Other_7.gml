event_inherited();

if(sprite_index == spr_injectorGrabStartup)
{
	image_speed = 0;
	image_index = image_number - 1;
	ZombieChangeState(ZombieStateInjectorClaw);
}

if(sprite_index == spr_injectoratk2)
{
	specialCooldown = specialCooldownTime;
	clawPos = clawOffset;
	clawCanGrab = true;
	DamagePlayer(grabTarget, damage, "Zombie", name);
	DebuffApply(grabTarget, DeBuff.Poison);
	grabTarget.isGrabbed = false;
	grabTarget.canMove = true;
	grabTarget = noone;
	pinButtonMash = 0;
	pinButtonCount = 0;
	ZombieChangeState(ZombieStateInjector);
}