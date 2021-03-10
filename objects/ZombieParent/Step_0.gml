//show health
if(showHealth)
{
	showHealthTimer -= DeltaTimeSecond();
	if(showHealthTimer <= 0)
		showHealth = false;
}

//fade out
if(fadeOut > 0)
{
	fadeOut -= 1;
	image_alpha = fadeOut / fadeOutTime;
	if(fadeOut <= 0)
		instance_destroy();
}

//movement/gravity
if(target != noone and !isDead and !isAttacking and !specialActive)
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

//handle sprites/flipping
if(!isDead and !isAttacking and !specialActive)
{
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

//collisions
var checkForBarricade = instance_place(x + xSpeed + image_xscale, y, Barricade);
if(checkForBarricade and checkForBarricade.canCollideZombie)
{
	if(barricadeID == noone)
		DamageZombie(checkForBarricade.playerID, id, checkForBarricade.damage);
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
	while(!place_meeting(x + sign(xSpeed), y, block))
	{
		x += sign(xSpeed);
	}
	if(place_meeting(x, y+1, BlockParent) and !place_meeting(x+sign(xSpeed), y - 64, BlockParent))
		ySpeed = -jumpSpeed;
	xSpeed = 0;
}
x += xSpeed * DeltaTime();

block = place_meeting(x, y + ySpeed, BlockParent);
if(block)
{
	while(!place_meeting(x, y + sign(ySpeed), block))
	{
		y += sign(ySpeed);
	}
	ySpeed = 0;
}
y += ySpeed * DeltaTime();

//attack
if(!isDead and !isAttacking and target != noone and !specialActive)
{
	if(distance_to_object(target) <= attackRange or barricadeID != noone)
	{
		isAttacking = true;
		image_speed  = 0.5;
		var index = 0;
		if(spriteAttack[1] != noone)
			index = irandom(1);
		sprite_index = spriteAttack[index];
	}
}