//stats
hp = 100;
armour = 100;
stamina = 100;

maxHp = hp;
maxArmour = armour;
maxStamina = stamina;

instance_create_layer(x, y, "Instances", PlayerHUD).playerID = id;

//movement
xSpeed = 0;
ySpeed = 0;
maxSpeed = 4;
sprintSpeed = 6;
jumpSpeed = 15;
maxFallSpeed = 12;
acceleration = 0.5;
grav = 0.981;
friction = 0.75;

//control
canShoot = true;
shootTimer = 0;
player_inputID = Controller.Gamepad1;

//weapons
currentWeapon = 0;
weapon[0] = Weapon.Rifle;
weapon[1] = Weapon.Pistol;
meleeWeapon = Weapon.Knife;
explosives = noone;

//sprites
idle = spr_player;
head = spr_playerheads;
torso = spr_playertorso;
arms = spr_playerjustarms;
guns = spr_playerarms;
legs = spr_playerlegs;
jumping = spr_playerjumping;

head_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
arm_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
torso_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
leg_color = make_color_rgb(irandom(255), irandom(255), irandom(255));

isWalking = false;
isJumping = false;

head_index = irandom(sprite_get_number(head));
torso_index = irandom(sprite_get_number(torso));
walking_index = 0;