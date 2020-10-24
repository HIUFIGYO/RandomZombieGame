var inst;
var xThrow = InputGetAxis(player_inputID, Axis.Horizontal);

//Calculate velocity
var maxSpd = maxSpeed;
if(InputGetButton(player_inputID, Button.Sprint))
{
	maxSpd = sprintSpeed;
}
xSpeed += xThrow * acceleration;
xSpeed = clamp(xSpeed, -maxSpd, maxSpd);

ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

//Friction/flip
if(xThrow == 0)
{
	isWalking = false;
	xSpeed = lerp(0, xSpeed, friction);
}
else
{
	isWalking = true;
	image_xscale = sign(xThrow);
}

//Jump
if(InputGetButton(player_inputID, Button.Jump)and !isJumping and place_meeting(x, y+1, BlockParent))
{
	isJumping = true;
	ySpeed = -jumpSpeed;
}

//Collision
inst = instance_place(x+xSpeed, y, BlockParent);
if(inst and !inst.isOneWay)
{
	while(!place_meeting(x+sign(xSpeed), y, BlockParent))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
x += xSpeed * DeltaTime();

inst = instance_place(x, y + ySpeed, BlockParent);
if(inst)
{
	var collide = true;
	if(inst.isOneWay)
	{
		if(ySpeed > 0 and y > inst.y)
			collide = false;
		if(ySpeed < 0)
			collide = false;
	}
		
	if(collide)
	{
		while(!place_meeting(x, y+sign(ySpeed), BlockParent))
		{
			y += sign(ySpeed);
		}
		if(ySpeed > 0)
			isJumping = false;
		ySpeed = 0;
		if(inst.isOneWay and InputGetButtonDown(player_inputID, Button.Crouch))
			ySpeed = 1;
	}
}
y += ySpeed * DeltaTime();

//shooting
if(shootTimer > 0)
{
	shootTimer -= DeltaTime() / game_get_speed(gamespeed_fps);
	if(shootTimer <= 0)
	{
		canShoot = true;
	}
}

if(canShoot)
{
	if(InputGetButtonDown(player_inputID, Button.ToggleWeapon))
	{
		currentWeapon = !currentWeapon;
	}
	
	if(InputGetButton(player_inputID, Button.Shoot))
	{
		canShoot = false;
		shootTimer = DataWeapon(weapon[currentWeapon], WeapStat.FireRate);
		CreateBullet(x, y, weapon[currentWeapon], 1, image_xscale);
	}	
}

//Animations
if(isWalking)
{
	var walkingAnimSpeed = 0.6;
	if(maxSpd == sprintSpeed)
		walkingAnimSpeed = 1;
	walking_index += walkingAnimSpeed;
	if(walking_index >= sprite_get_number(legs))
		walking_index = 0;	
}