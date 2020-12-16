//stats
hp = 100;
armour = 100;
stamina = 100;

hpRegenRate = 1;
hpRegenTime = 4;
hpRegenTimer = 0;

staminaRegenRate = 20;//units per second
staminaWaitTime = 0.5;//seconds
staminaWaitTimer = 0;

maxHp = hp;
maxArmour = armour;
maxStamina = stamina;

kills = 0;
money = 250;

//buffs/debuffs

buff[0] = Buff.Demo;
buff[1] = noone;
buffCooldown[0] = 0;
buffCooldown[1] = 0;

for(var i=0; i<DeBuff.count; i++)
{
	deBuff[i] = false;
	deBuffStack[i] = 0;
	deBuffTimer[i] = 0;
}

//weapons
currentWeapon = 0;
weapon[0] = Weapon.Rifle;
ammo[0] = DataWeapon(weapon[0], WeapStat.Ammo);
mag[0] = DataWeapon(weapon[0], WeapStat.Mag);
reloadTimer[0] = 0;
reloadSingleShot[0] = 0;

weapon[1] = Weapon.Pistol;
ammo[1] = DataWeapon(weapon[1], WeapStat.Ammo);
mag[1] = DataWeapon(weapon[1], WeapStat.Mag);
reloadTimer[1] = 0;
reloadSingleShot[1] = 0;

meleeWeapon = Weapon.Knife;
canSpawnMeleeHB = true;
grenadeType = ExplosiveType.Grenade;
grenadeAmount = 3;
healingItem = HealingType.Medicine;
healingItemAmount = 1;

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
maxFallSpeed = 20;
acceleration = 0.5;
grav = 0.981;
friction = 0.75;

//control
canShoot = true;
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
canMove = true;

meleeSubImage = 0;
throwSubImage = 0;
crouchOffset = 6;

//sprites and colors
idle = spr_player;
head = spr_playerheads;
torso = spr_playertorso;
arms = spr_playerjustarms;
guns = spr_playerarms;
legs = spr_playerlegs;
jumping = spr_playerjumping;
cosmetic = spr_playercosmetics;
crouch = spr_legscrouch;
throwSprite = spr_playerthrow;
dead = choose(spr_playerdead, spr_playerincapacitated);
melee[0] = spr_playermelee1;
melee[1] = spr_playermelee2;
melee[2] = spr_playermelee3;
melee[3] = spr_playermelee4;
melee[4] = spr_playermelee11;
melee[5] = spr_playermelee21;
melee[6] = spr_playermelee31;
melee[7] = spr_playermelee41;

head_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
arm_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
torso_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
leg_color = make_color_rgb(irandom(255), irandom(255), irandom(255));

head_index = irandom(sprite_get_number(head));
torso_index = irandom(sprite_get_number(torso));
cosmetic_index = irandom(sprite_get_number(cosmetic));
walking_index = 0;