///@function ZombieHealthDisplayTimer()

function ZombieHealthDisplayTimer()
{
	if(!showHealth)
		return;
		
	showHealthTimer -= DeltaTimeSecond();
	if(showHealthTimer <= 0)
	{
		showHealth = false;
	}
}

///@function ZombieFadeOut()

function ZombieFadeOut()
{
	if(fadeOut == 0)
		return;
		
	fadeOut -= 1;
	image_alpha = fadeOut / fadeOutTime;
	if(fadeOut <= 0)
		instance_destroy();
}

///@function ZombieAddVelocity()

function ZombieAddVelocity()
{
	if(instance_exists(target) and !isDead and !isAttacking)
	{
		var dir = sign(target.x - x);
		xSpeed += acceleration * dir;
	}
	else
	{
		if(xSpeed != 0 and instance_place(x, y+1, BlockParent))
			xSpeed = lerp(0, xSpeed, friction);
	}

	xSpeed = clamp(xSpeed, -moveSpeed, moveSpeed);

	ySpeed += grav;
	ySpeed = min(ySpeed, maxFallSpeed);
}

///@function ZombieAnimate()

function ZombieAnimate()
{
	if(isAttacking)
		return;

	if(xSpeed != 0)
		image_xscale = sign(xSpeed);
	image_speed = min(moveSpeed * 0.2, 0.5);
	if(xSpeed == 0)
	{
		image_speed = 0;
		sprite_index = spriteIdle;
	}
	else
		sprite_index = spriteWalk;

}

///@function ZombieCheckCollision()

function ZombieCheckCollision()
{
	var checkForBarricade = instance_place(x + xSpeed + image_xscale, y, Barricade);
	if(checkForBarricade and BarricadeCanCollideZombie(checkForBarricade))
	{
		if(barricadeID == noone)
		{
			DamageZombie(checkForBarricade.playerID, id, checkForBarricade.damage);
			if(checkForBarricade.playerID != noone)
				EndStatAdd(checkForBarricade.playerID.playerID, EndStat.SupportDamage, checkForBarricade.damage);
		}
		barricadeID = checkForBarricade;
		while(xSpeed != 0 and !place_meeting(x + sign(xSpeed), y, Barricade))
		{
			x += sign(xSpeed);
		}
		xSpeed = 0;
	}
	else
		barricadeID = noone;

	var block = place_meeting(x + xSpeed, y, BlockParent);
	if(block)
	{
		while(xSpeed != 0 and !place_meeting(x + sign(xSpeed), y, block))
		{
			x += sign(xSpeed);
		}
		if(place_meeting(x, y+1, BlockParent) and !place_meeting(x+sign(xSpeed), y - 64, BlockParent))
			ySpeed = -jumpSpeed;
		xSpeed = 0;
	}

	block = place_meeting(x, y + ySpeed, BlockParent);
	if(block)
	{
		while(ySpeed != 0 and !place_meeting(x, y + sign(ySpeed), block))
		{
			y += sign(ySpeed);
		}
		ySpeed = 0;
	}
}

///@function ZombieTranslate()

function ZombieTranslate()
{
	x += xSpeed * DeltaTime();
	y += ySpeed * DeltaTime();
}

///@function ZombieAttack()

function ZombieAttack()
{
	if(isDead)
		return;
	
	if(!isAttacking and target != noone)
	{
		if(distance_to_object(target) <= attackRange or barricadeID != noone)
		{
			isAttacking = true;
			image_speed  = attackSpeed;
			var index = 0;
			if(spriteAttack[1] != noone)
				index = irandom(1);
			sprite_index = spriteAttack[index];
		}
	}
}

