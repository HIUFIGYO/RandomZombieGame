//stats
hp = 100;
armour = 100;
stamina = 100;

maxHp = hp;
maxArmour = armour;
maxStamina = stamina;

//movement
xSpeed = 0;
ySpeed = 0;
maxSpeed = 4;
sprintSpeed = 6;
jumpSpeed = 12;
maxFallSpeed = 12;
acceleration = 0.5;
grav = 0.981;
friction = 0.75;

//control
canShoot = true;
shootTimer = 0;
shootTimerMax = 30;
player_inputID = Controller.Gamepad1;

//weapons
currentWeapon = 0;
weapon[0] = noone;
weapon[1] = noone;
meleeWeapon = Weapon.Knife;
explosives = noone;

//sprites
idle = spr_player;
head = spr_playerheads;
torso = spr_playertorso;
arms = spr_playerarms;
legs = spr_playerlegs;
jumping = spr_playerjumping;

head_color = c_white;
arm_color = c_white;
torso_color = c_green;
leg_color = c_blue;

isWalking = false;
isJumping = false;

head_index = 3;
torso_index = 0;
walking_index = 0;