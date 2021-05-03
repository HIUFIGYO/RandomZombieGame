///@function PlayerInitStats()

function PlayerInitStats()
{
	name = "Player";
	damageTag = "";
	zombieTag = "";

	//stats
	invincible = 0;
	hp = 100;
	armour = 0;
	stamina = 100;

	hpRegenRate = 1;
	hpRegenTime = 4;
	hpRegenTimer = 0;

	staminaRegenRate = 20;//units per second
	staminaWaitTime = 0.5;//seconds
	staminaWaitTimer = 0;

	maxHp = hp;
	maxArmour = 100;
	maxStamina = stamina;

	kills = 0;
	money = 250;
	bankedMoney = 0;
}

///@function PlayerInitBuffs()

function PlayerInitBuffs()
{
	buff[0] = noone;
	buff[1] = noone;
	buffCooldown[0] = 0;
	buffCooldown[1] = 0;
	damageResistanceTimer = 0;
	bleedMaxTimer = 0;
}

///@function PlayerInitWeapons()

function PlayerInitWeapons()
{
	equipmentCycle = EquipCycle.Weapon;

	//primary
	currentWeapon = 1;
	weapon[0] = noone;
	ammo[0] = 0;
	mag[0] = 0;
	reloadTimer[0] = 0;
	reloadSingleShot[0] = 0;

	//secondary
	weapon[1] = noone;
	ammo[1] = 0;
	mag[1] = 0;
	reloadTimer[1] = 0;
	reloadSingleShot[1] = 0;

	//melee weapon
	meleeWeapon = Weapon.Knife;
	canSpawnMeleeHB = true;

	//grenades
	grenadeType = GrenadeType.Grenade;
	grenadeAmount = 3;
}

///@function PlayerInitGear()

function PlayerInitGear()
{
	//med item
	healingItem = noone;
	healingItemAmount = 0;
	healingItemTimer = 0;
	healingID = noone;
	
	//vials
	vial = noone;
	currentVial = noone;
	vialActive = false;
	vialCooldown = 0;
	vialPositiveTimer = 0;
	vialNegativeTimer = 0;

	//support
	supportItem = noone;
	canPlaceSupport = false;
	supportXOffset = 32;
	supportYOffset = 8;
}

///@function PlayerInitRevive()

function PlayerInitRevive()
{
	revivingPlayer = noone;
	revivePlayerCount = 0;
	reviveTime = 3;
	reviveTimer = reviveTime;
}

///@function PlayerInitPhysics()

function PlayerInitPhysics()
{
	xSpeed = 0;
	ySpeed = 0;
	maxSpeed = 4;
	sprintSpeed = 6;
	jumpSpeed = 20;
	jumpCount = 0;
	maxFallSpeed = 20;
	acceleration = 0.5;
	grav = 0.981;
	friction = 0.75;
	pauseX = 0;
	pauseY = 0;
}

///@function PlayerInitControl()

function PlayerInitControl()
{
	canShoot = true;
	autoFire = false;
	shootTimer = 0;
	player_inputID = Controller.Gamepad1;
	playerID = 0;
	
	isGrabbed = false;
	isPinned = false;
	isWalking = false;
	isJumping = false;
	isGrounded = false;
	isCrouching = false;
	isMelee = false;
	isThrowing = false;
	isDead = false;
	isInMenu = false;
	canMove = true;

	meleeSubImage = 0;
	throwSubImage = 0;
	crouchOffset = 6;
}

///@function PlayerInitSprites()

function PlayerInitSprites()
{
	spriteIdle = spr_player;
	spriteHead = spr_playerheads;
	spriteTorso = spr_playertorso;
	spriteArms = spr_playerArms;
	spriteGuns = spr_playerArmsGuns;
	spriteReloadArms = spr_playerReloadArms;
	spriteReloadGuns = spr_playerReloadGuns;
	spriteLegs = spr_playerlegs;
	spriteJumping = spr_playerjumping;
	spriteCosmetic = spr_playercosmetics;
	spriteCrouch = spr_legscrouch;
	spriteThrow = spr_playerthrow;

	spriteDeadHead = spr_playerincapacitated_Head;
	spriteDeadTorso = spr_playerincapacitated_Torso;
	spriteDeadArms = spr_playerincapacitated_Arms;
	spriteDeadLegs = spr_playerincapacitated_Legs;
	
	spriteIncapHead = spr_playerdead_Head;
	spriteIncapTorso = spr_playerdead_Torso;
	spriteIncapArms = spr_playerPinnedArms;
	spriteIncapLegs = spr_playerPinnedLegs;

	spriteMelee[0] = spr_playerMelee1Arms;
	spriteMelee[1] = spr_playerMelee2Arms;
	spriteMelee[2] = spr_playerMelee3Arms;
	spriteMelee[3] = spr_playerMelee4Arms;
	spriteMelee[4] = spr_playerMelee1Weapon;
	spriteMelee[5] = spr_playerMelee2Weapon;
	spriteMelee[6] = spr_playerMelee3Weapon;
	spriteMelee[7] = spr_playerMelee4Weapon;

	head_index = irandom(sprite_get_number(spriteHead));
	torso_index = irandom(sprite_get_number(spriteTorso));
	cosmetic_index = irandom(sprite_get_number(spriteCosmetic));
	walking_index = 0;
	incapIndex = 0;
}

///@function PlayerInitColor()

function PlayerInitColor()
{
	head_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
	arm_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
	torso_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
	leg_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
}
