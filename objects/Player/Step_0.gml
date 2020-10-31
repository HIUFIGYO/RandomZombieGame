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
if(!isJumping and InputGetButton(player_inputID, Button.Jump) and(place_meeting(x, y+1, BlockParent)or place_meeting(x, y+1, OneWayBlock)))
{
	isJumping = true;
	ySpeed = -jumpSpeed;
}

//Collision
if(place_meeting(x+xSpeed, y, BlockParent))
{
	while(!place_meeting(x+sign(xSpeed), y, BlockParent))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
x += xSpeed * DeltaTime();

isGrounded = false;
if(place_meeting(x, y+ySpeed, BlockParent))
{
	while(!place_meeting(x, y+sign(ySpeed), BlockParent))
	{
		y += sign(ySpeed);
	}
	if(ySpeed > 0)
		isJumping = false;
	isGrounded = true;
	ySpeed = 0;
}
var oneWay = instance_place(x, y + ySpeed, OneWayBlock);
if(oneWay)
{
	if(ySpeed > 0 and floor(y) <= oneWay.y)
	{
		while(!place_meeting(x, y+sign(ySpeed), OneWayBlock))
		{
			y += sign(ySpeed);
		}
		isGrounded = true;
		ySpeed = 0;
		isJumping = false;
		if(InputGetButtonDown(player_inputID, Button.Crouch))
			ySpeed = 2;
	}
}
y += ySpeed * DeltaTime();

//shooting
if(shootTimer > 0)
{
	shootTimer -= 1;
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
	
	var auto = DataWeapon(weapon[currentWeapon], WeapStat.Auto);
	var shoot = false;
	if(!auto and InputGetButtonDown(player_inputID, Button.Shoot))
	{
		shoot = true;
	}
	
	if(auto and InputGetButton(player_inputID, Button.Shoot))
	{
		shoot = true;
	}
	
	if(shoot)
	{
		canShoot = false;
		shootTimer = DataWeapon(weapon[currentWeapon], WeapStat.FireRate) * game_get_speed(gamespeed_fps);
		CreateBullet(x, y, weapon[currentWeapon], DataWeapon(weapon[currentWeapon], WeapStat.Burst), image_xscale);
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