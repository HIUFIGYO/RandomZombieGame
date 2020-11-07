//stats
hp = 100;
armour = 100;
stamina = 100;

maxHp = hp;
maxArmour = armour;
maxStamina = stamina;

kills = 0;
money = 0;

buffs = noone;
deBuffs = noone;

//weapons
currentWeapon = 0;
weapon[0] = Weapon.Rifle;
weapon[1] = Weapon.Pistol;
meleeWeapon = Weapon.Knife;
explosives = noone;
grenadeAmount = 5;

//movement
xSpeed = 0;
ySpeed = 0;
maxSpeed = 6;
sprintSpeed = 8;
jumpSpeed = 20;
maxFallSpeed = 20;
acceleration = 0.5;
grav = 0.981;
friction = 0.75;

//control
canShoot = true;
shootTimer = 0;
player_inputID = Controller.Gamepad1;

isWalking = false;
isJumping = false;
isGrounded = false;
isCrouching = false;
isMelee = false;
isThrowing = false;

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
melee[0] = spr_playermelee1;
melee[1] = spr_playermelee2;
melee[2] = spr_playermelee3;
melee[3] = spr_playermelee4;

head_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
arm_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
torso_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
leg_color = make_color_rgb(irandom(255), irandom(255), irandom(255));

head_index = irandom(sprite_get_number(head));
torso_index = irandom(sprite_get_number(torso));
cosmetic_index = irandom(sprite_get_number(cosmetic));
walking_index = 0;

//UI Elements
hpBar = UICreateHealthbar(8, 8, UIDrawTo.ViewPort);
hpBar.drawView = player_inputID;
hpBar.color = c_black;
UISetSize(hpBar, 200, 16);

hpText = UICreateText(8, 32, "", UIDrawTo.ViewPort);
hpText.color = c_yellow;