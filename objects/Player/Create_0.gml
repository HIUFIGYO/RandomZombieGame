name = "Player";
damageTag = "";
zombieTag = "";

//stats
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

//buffs/debuffs

buff[0] = Buff.Ammo;
buff[1] = noone;
buffCooldown[0] = 0;
buffCooldown[1] = 0;
damageResistanceTimer = 0;
bleedMaxTimer = 0;

InitDebuffs(id);

//weapons
equipmentCycle = EquipCycle.Weapon;

//primary
currentWeapon = 1;
weapon[0] = noone;
ammo[0] = DataWeapon(weapon[0], WeapStat.Ammo);
mag[0] = DataWeapon(weapon[0], WeapStat.Mag);
reloadTimer[0] = 0;
reloadSingleShot[0] = 0;

//secondary
weapon[1] = Weapon.Pistol;
ammo[1] = DataWeapon(weapon[1], WeapStat.Ammo);
mag[1] = DataWeapon(weapon[1], WeapStat.Mag);
reloadTimer[1] = 0;
reloadSingleShot[1] = 0;

//melee weapon
meleeWeapon = Weapon.Knife;
canSpawnMeleeHB = true;

//grenade
grenadeType = ExplosiveType.Grenade;
grenadeAmount = 3;

//med item
healingItem = HealingType.Medicine;
healingItemAmount = 1;
healingItemTimer = 0;

if(global.difficulty == GameDifficulty.Easy)
	GiveMedical(id, HealingType.Medicine);

//vials
vial = VialType.Adrenaline;
vialActive = false;
vialCooldown = 0;
vialPositiveTimer = 0;
vialNegativeTimer = 0;

//support
supportItem = SupportType.Turret;
canPlaceSupport = false;
supportXOffset = 32;
supportYOffset = 8;


//reviving
revivingPlayer = noone;
revivePlayerCount = 0;
reviveTime = 3;
reviveTimer = reviveTime;

//movement
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

//control
canShoot = true;
autoFire = false;
shootTimer = 0;
player_inputID = Controller.Gamepad1;
playerID = 0;

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

//sprites and colors
spriteIdle = spr_player;
spriteHead = spr_playerheads;
spriteTorso = spr_playertorso;
spriteArms = spr_playerjustarms;
spriteGuns = spr_playerarms;
spriteLegs = spr_playerlegs;
spriteJumping = spr_playerjumping;
spriteCosmetic = spr_playercosmetics;
spriteCrouch = spr_legscrouch;
spriteThrow = spr_playerthrow;

spriteDeadHead = spr_playerincapacitated_Head;
spriteDeadTorso = spr_playerincapacitated_Torso;
spriteDeadArms = spr_playerincapacitated_Arms;
spriteDeadLegs = spr_playerincapacitated_Legs;

spriteMelee[0] = spr_playermelee1;
spriteMelee[1] = spr_playermelee2;
spriteMelee[2] = spr_playermelee3;
spriteMelee[3] = spr_playermelee4;
spriteMelee[4] = spr_playermelee11;
spriteMelee[5] = spr_playermelee21;
spriteMelee[6] = spr_playermelee31;
spriteMelee[7] = spr_playermelee41;

head_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
arm_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
torso_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
leg_color = make_color_rgb(irandom(255), irandom(255), irandom(255));

head_index = irandom(sprite_get_number(spriteHead));
torso_index = irandom(sprite_get_number(spriteTorso));
cosmetic_index = irandom(sprite_get_number(spriteCosmetic));
walking_index = 0;