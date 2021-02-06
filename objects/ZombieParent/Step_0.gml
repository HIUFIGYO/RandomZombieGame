//find target
if(!isDead)
{
	var targetCount = instance_number(Player);
	var targets = ds_grid_create(2, targetCount);
	for(var i=0; i<targetCount; i++)
	{
		var _player = instance_find(Player, i);
		ds_grid_add(targets, 0, i, _player);
		ds_grid_add(targets, 1, i, distance_to_object(_player));
	}
	ds_grid_sort(targets, 1, true);

	target = noone;
	for(i=0; i<targetCount; i++)
	{
		if(!targets[# 0, i].isDead and !CheckVialPositive(targets[# 0, i], VialType.Mimicry))
		{
			target = targets[# 0, i];
			break;
		}
	}

	ds_grid_destroy(targets);
}

//health
if(!isDead and hp <= 0)
{
	GameZombieDead(id);
	GameSprayBlood(GameGetBloodAmount(), x, y - (bbox_bottom - bbox_top) / 2, acid, 0);
	isDead = true;
	hp = 0;
	color = c_white;
	image_speed = 0;
	sprite_index = spriteDead;
}
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
if(target != noone and !isDead and !isAttacking)
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
if(!isDead and !isAttacking)
{
	if(xSpeed != 0)
		image_xscale = sign(xSpeed);
	image_speed = 0.5;
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

if(place_meeting(x + xSpeed, y, BlockParent))
{
	while(!place_meeting(x + sign(xSpeed), y, BlockParent))
	{
		x += sign(xSpeed);
	}
	if(place_meeting(x, y+1, BlockParent) and !place_meeting(x+sign(xSpeed), y - 64, BlockParent))
		ySpeed = -jumpSpeed;
	xSpeed = 0;
}
x += xSpeed * DeltaTime();

if(place_meeting(x, y + ySpeed, BlockParent))
{
	while(!place_meeting(x, y + sign(ySpeed), BlockParent))
	{
		y += sign(ySpeed);
	}
	ySpeed = 0;
}
y += ySpeed * DeltaTime();

//attack

if(!isDead and !isAttacking and target != noone)
{
	if(distance_to_object(target) <= attackRange)
	{
		isAttacking = true;
		image_speed  = 0.5
		sprite_index = spriteAttack;
	}
	else if(barricadeID != noone)
	{
		isAttacking = true;
		image_speed  = 0.5
		sprite_index = spriteAttack;
	}
}