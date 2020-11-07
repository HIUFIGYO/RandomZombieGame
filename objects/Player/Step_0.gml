var xThrow = InputGetButton(player_inputID, Button.Right) - InputGetButton(player_inputID, Button.Left);

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
var fallThrough = false;
if(!isJumping and InputGetButton(player_inputID, Button.Jump))
{
	if(isCrouching and place_meeting(x, y+1, OneWayBlock))
	{
		fallThrough = true;
		ySpeed = 2;
	}
	else if(place_meeting(x, y+1, BlockParent)or place_meeting(x, y+1, OneWayBlock))
	{
		isJumping = true;
		ySpeed = -jumpSpeed;
	}
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
x += clamp(xSpeed * DeltaTime(), -maxSpd, maxSpd);

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
		if(!fallThrough)
			ySpeed = 0;
		isJumping = false;
	}
}
y += clamp(ySpeed * DeltaTime(), -jumpSpeed, maxFallSpeed);

//crouching
if(InputGetButton(player_inputID, Button.Crouch) and isGrounded and !isWalking)
{
	isCrouching = true;
}
else
	isCrouching = false;

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
	var performedAction = false;
	if(InputGetButtonDown(player_inputID, Button.ToggleWeapon))
	{
		currentWeapon = !currentWeapon;
		performedAction = true;
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
	
	if(shoot and !performedAction)
	{
		performedAction = true;
		canShoot = false;
		shootTimer = DataWeapon(weapon[currentWeapon], WeapStat.FireRate) * game_get_speed(gamespeed_fps);
		var offset = 0;
		if(isCrouching)
			offset = crouchOffset;
		CreateBullet(id, x, y + offset, weapon[currentWeapon], image_xscale, isCrouching);
	}
	
	if(!performedAction and InputGetButtonDown(player_inputID, Button.Melee))
	{
		performedAction = true;
		canShoot = false;
		isMelee = true;
	}
	
	if(!performedAction and InputGetButtonDown(player_inputID, Button.Grenade)and grenadeAmount > 0)
	{
		canShoot = false;
		isThrowing = true;
	}
}

//Animations
if(isWalking)
{
	var walkingAnimSpeed = 0.6;
	if(maxSpd == sprintSpeed)
		walkingAnimSpeed = 1;
	walking_index += walkingAnimSpeed * DeltaTime();
	if(walking_index >= sprite_get_number(legs))
		walking_index = 0;	
}

if(isMelee)
{
	var index = 0;
	if(meleeWeapon == Weapon.Knife2)
		index = 1;
	else if(meleeWeapon == Weapon.Knife3)
		index = 2;
	else if(meleeWeapon == Weapon.Knife4)
		index = 3;
		
	meleeSubImage += DataWeapon(meleeWeapon, WeapStat.FireRate) * DeltaTime();
	if(meleeSubImage >= sprite_get_number(melee[index]))
	{
		canShoot = true;
		isMelee = false;
		meleeSubImage = 0;
	}
}

if(isThrowing)
{
	throwSubImage += DeltaTime();
	if(throwSubImage >= sprite_get_number(throwSprite))
	{
		grenadeAmount -= 1;
		canShoot = true;
		isThrowing = false;
		throwSubImage = 0;
		var inst = instance_create_layer(x, y - 40, GameManager.layerObject, Grenade);
		inst.xSpeed = image_xscale * 16;
		inst.ySpeed = -10;
	}
}

//UI Elements
hpBar.value = hp/maxHp;
hpText.text = string(hp) + "/" + string(maxHp);