hp = 5;
damage = 1;

isDead = false;
fadeOut = 0;
fadeOutTime = 150;
isAttacking = false;
attackRange = 1;

grav = 0.981;
acceleration = 0.1;
moveSpeed = 2;
jumpSpeed = 12;
maxFallSpeed = 12;
xSpeed = 0;
ySpeed = 0;
target = noone;
friction = 0.3;

image_speed = 1;
spriteIdle = noone;
spriteWalk = noone;
spriteAttack = noone;
spriteSpecial = noone;
spriteDead = noone;

//game manager notify
GameAddZombie();