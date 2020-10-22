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
if(InputGetButton(player_inputID, Button.Jump) and place_meeting(x, y+1, BlockParent))
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

if(place_meeting(x, y+ySpeed, BlockParent))
{
	if(ySpeed > 0)
		isJumping = false;
	while(!place_meeting(x, y+sign(ySpeed), BlockParent))
	{
		y += sign(ySpeed);
	}
	ySpeed = 0;
}
y += ySpeed * DeltaTime();

//shooting
if(shootTimer > 0)
{
	shootTimer -= DeltaTime();
	if(shootTimer <= 0)
	{
		canShoot = true;
	}
}

if(canShoot and InputGetButton(player_inputID, Button.Shoot))
{
	canShoot = false;
	shootTimer = shootTimerMax;
	var inst = instance_create_layer(x, y - 64, "Instances", Bullet);
	inst.xSpeed = image_xscale;
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