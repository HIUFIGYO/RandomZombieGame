//health
if(!isDead and hp <= 0)
{
	GameRemoveZombie();
	GameZombieDead(id);
	isDead = true;
	hp = 0;
	image_speed = 0;
	sprite_index = spriteDead;
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
if(target != noone and !isDead and !isAttacking)
{
	var dir = sign(target.x - x);
	xSpeed += acceleration * dir;
}
else
{
	xSpeed = lerp(0, xSpeed, friction);
}

xSpeed = clamp(xSpeed, -moveSpeed, moveSpeed);

ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

//handle sprites/flipping
if(!isDead and !isAttacking)
{
	image_xscale = sign(xSpeed);
	if(xSpeed == 0)
		sprite_index = spriteIdle;
	else
		sprite_index = spriteWalk;
}

//collisions
if(place_meeting(x + xSpeed, y, BlockParent))
{
	while(!place_meeting(x + sign(xSpeed), y, BlockParent))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
	if(!place_meeting(x+sign(xSpeed), y - 65, BlockParent))
		ySpeed = -jumpSpeed;
}
x += xSpeed;

if(place_meeting(x, y + ySpeed, BlockParent))
{
	while(!place_meeting(x, y + sign(ySpeed), BlockParent))
	{
		y += sign(ySpeed);
	}
	ySpeed = 0;
}
y += ySpeed;

//attack
if(!isDead and !isAttacking and target != noone)
{
	if(distance_to_object(target) <= attackRange)
	{
		isAttacking = true;
		sprite_index = spriteAttack;
	}
}