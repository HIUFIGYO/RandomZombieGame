hp = 5;
damage = 1;
acid = false;

isDead = false;
fadeOut = 0;
fadeOutTime = 150;
isAttacking = false;
attackRange = 1;

grav = 0.981;
acceleration = 0.1;
moveSpeed = 2;
jumpSpeed = 20;
maxFallSpeed = 20;
xSpeed = 0;
ySpeed = 0;
target = noone;
friction = 0.3;

image_speed = 0.5;
spriteIdle = noone;
spriteWalk = noone;
spriteAttack = noone;
spriteSpecial = noone;
spriteDead = noone;

//game manager notify
GameAddZombie();

//cosmetic
cosmetic = spr_zombieSeasonalHats;
cosmetic_index = irandom(sprite_get_number(cosmetic));