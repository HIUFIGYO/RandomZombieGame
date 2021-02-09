var xThrow = (InputPlayerGetButton(player_inputID, Button.Right) - InputPlayerGetButton(player_inputID, Button.Left));

//sprinting
var bonus = false;
if(CheckBuff(id, Buff.Agility)and !deBuff[DeBuff.Bleed])
	bonus = true;
var maxSpd = maxSpeed;
if(InputPlayerGetButton(player_inputID, Button.Sprint)and stamina > 0 and xThrow != 0)
{
	stamina -= 10 * DeltaTimeSecond();
	staminaWaitTimer = staminaWaitTime;
	maxSpd = sprintSpeed;
}
maxSpd += (bonus * DataBase.agilityBuffJogSpeed) - deBuff[DeBuff.Bleed] + CheckVialPositive(id, VialType.Adrenaline) - CheckVialNegative(id, VialType.Rapid);

//Calculate velocity
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

//crouching
isGrounded = (place_meeting(x, y+1, BlockParent) or place_meeting(x, y+1, OneWayBlock)) and ySpeed >= 0;
if(isGrounded)
	jumpCount = 0;

if(InputPlayerGetButton(player_inputID, Button.Crouch) and isGrounded and !isWalking)
{
	isCrouching = true;
}
else
	isCrouching = false;

//Jump/fallthrough
var fallThrough = false;
if(InputPlayerGetButtonDown(player_inputID, Button.Jump))
{
	if(isCrouching and place_meeting(x, y+1, OneWayBlock))
	{
		fallThrough = true;
		isJumping = true;
		if(ySpeed == grav)
			ySpeed = 2;
	}
	else if(jumpCount < 1 + CheckVialPositive(id, VialType.Adrenaline))
	{
		jumpCount++;
		isJumping = true;
		ySpeed = -jumpSpeed;
	}
}

//Collision
var checkForBarricade = instance_place(x+xSpeed, y, Barricade);
if(checkForBarricade and checkForBarricade.canCollidePlayer)
{
	while(!place_meeting(x+sign(xSpeed), y, Barricade))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
}

var block = instance_place(x+xSpeed, y, BlockParent);
if(block)
{
	while(!place_meeting(x+sign(xSpeed), y, block))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
x += clamp(xSpeed * DeltaTime(), -maxSpd, maxSpd);

block = instance_place(x, y+ySpeed, BlockParent);
if(block)
{
	while(!place_meeting(x, y+sign(ySpeed), block))
	{
		y += sign(ySpeed);
	}
	if(ySpeed > 0)
		isJumping = false;
	ySpeed = 0;
}
var oneWay = instance_place(x, y + ySpeed, OneWayBlock);
if(oneWay)
{
	if(ySpeed > 0 and floor(y) <= oneWay.y)
	{
		while(!place_meeting(x, y+sign(ySpeed), oneWay))
		{
			y += sign(ySpeed);
		}
		if(!fallThrough)
			ySpeed = 0;
		isJumping = false;
	}
	else
		isGrounded = false;
}
y += clamp(ySpeed * DeltaTime(), -jumpSpeed, maxFallSpeed);

//reloading

if(InputPlayerGetButtonDown(player_inputID, Button.Reload)and mag[currentWeapon] != GetMaxMag(id, currentWeapon))
{
	WeaponReload(id, weapon[currentWeapon]);
}

if(equipmentCycle == EquipCycle.Weapon and reloadTimer[currentWeapon] > 0)
{
	reloadTimer[currentWeapon] -= DeltaTimeSecond();
	reloadSingleShot[currentWeapon] -= DeltaTimeSecond();
	var clipSize;
	
	if(reloadSingleShot[currentWeapon] <= 0)
	{
		if(ammo[currentWeapon] > 1 and CanCancelReload(weapon[currentWeapon]))
		{
			ammo[currentWeapon] -= 1;
			mag[currentWeapon] += 1;
			if(mag[currentWeapon] < GetMaxMag(id, currentWeapon))
				reloadSingleShot[currentWeapon] = 1;
		}
	}
	
	if(reloadTimer[currentWeapon] <= 0)
	{
		reloadTimer[currentWeapon] = 0;
		ammo[currentWeapon] += mag[currentWeapon];
		clipSize = GetMaxMag(id, currentWeapon);
		if(clipSize <= ammo[currentWeapon])
		{
			mag[currentWeapon] = clipSize;
			ammo[currentWeapon] -= clipSize;
		}
		else
		{
			mag[currentWeapon] = ammo[currentWeapon];
			ammo[currentWeapon] = 0;
		}
	}
	
	if(InputPlayerGetButtonDown(player_inputID, Button.Shoot)and mag[currentWeapon] > 0 and CanCancelReload(weapon[currentWeapon]))
	{
		reloadTimer[currentWeapon] = 0;
	}
}

//shooting

if(shootTimer > 0)
{
	shootTimer -= 1;
	if(shootTimer <= 0)
	{
		canShoot = true;
	}
}

if(canShoot and !isDead and !isInMenu)
{
	var performedAction = false;
	
	if(CheckVialNegative(id, VialType.Strength))
	{
		performedAction = true;
		if(stamina >= 10 and InputGetButtonDown(player_inputID, Button.Melee))
			PlayerMelee(id);
	}
	
	if(!performedAction and InputGetButtonDown(player_inputID, Button.ToggleWeapon))
	{
		performedAction = true;
		if(equipmentCycle == EquipCycle.Weapon)
			currentWeapon = !currentWeapon;
		else
			equipmentCycle = EquipCycle.Weapon;
	}
	
	if(!performedAction)
	{
		var cycle = InputGetButtonDown(player_inputID, Button.NextGear) - InputGetButtonDown(player_inputID, Button.PreviousGear);
		if(cycle != 0)
		{
			performedAction = true;
			CycleGear(id, cycle);
		}
	}
	
	if(!performedAction)
	{
		performedAction = ProcessEquipment(id);
	}
	
	if(!performedAction and stamina >= 10 and InputGetButtonDown(player_inputID, Button.Melee))
	{
		performedAction = true;
		PlayerMelee(id);
	}
	
	if(!performedAction and InputGetButtonDown(player_inputID, Button.Grenade)and grenadeAmount > 0)
	{
		performedAction = true;
		canShoot = false;
		isThrowing = true;
	}
	
	if(!performedAction and InputGetButtonDown(player_inputID, Button.Assist))
	{
		HealingUse(id, id);
	}
}

//Animations
if(isWalking)
{
	var walkingAnimSpeed = 0.6;
	if(maxSpd == sprintSpeed)
		walkingAnimSpeed = 1;
	walking_index += walkingAnimSpeed * DeltaTime();
	if(walking_index >= sprite_get_number(spriteLegs))
		walking_index = 0;	
}

if(isMelee)
{
	staminaWaitTimer = staminaWaitTime;
	var index = 0;
	if(meleeWeapon == Weapon.Knife2)
		index = 1;
	else if(meleeWeapon == Weapon.Knife3)
		index = 2;
	else if(meleeWeapon == Weapon.Knife4)
		index = 3;
		
	meleeSubImage += DataWeapon(meleeWeapon, WeapStat.FireRate) * DeltaTime();
	
	if(meleeSubImage >= 2 and canSpawnMeleeHB)
	{
		var bonus = 1;
		if(CheckVialPositive(id, VialType.Strength))
			bonus = 2;
		canSpawnMeleeHB = false;
		var inst = CreateHitBox(id, x, y, spr_meleeHitBoxes, index, DataWeapon(meleeWeapon, WeapStat.Damage) * bonus);
		inst.pierce = DataWeapon(meleeWeapon, WeapStat.Pierce);
		inst.image_xscale = image_xscale;
	}
	if(meleeSubImage >= sprite_get_number(spriteMelee[index]) - 1)
	{
		canShoot = true;
		isMelee = false;
		meleeSubImage = 0;
	}
}

if(isThrowing)
{
	throwSubImage += DeltaTime();
	if(throwSubImage >= sprite_get_number(spriteThrow))
	{
		grenadeAmount -= 1;
		if(CheckBuff(id, Buff.Demo)and random(1) <= DataBase.demoBuffChanceGrenadeNotConsume)
			grenadeAmount += 1;
		canShoot = true;
		isThrowing = false;
		throwSubImage = 0;
		CreateGrenade(id);
	}
}

