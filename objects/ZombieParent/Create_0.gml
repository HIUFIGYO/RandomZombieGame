name = "Zombie";

invincible = false;
hp = 5;
maxHp = 5;
damage = 1;
acid = false;

isDead = false;
fadeOut = 0;
fadeOutTime = 150;
isAttacking = false;
attackRange = 1;

specialActive = false;

grav = 0.981;
acceleration = 0.1;
moveSpeed = 2;
jumpSpeed = 20;
maxFallSpeed = 20;
xSpeed = 0;
ySpeed = 0;
target = noone;
friction = 0.3;

color = c_white;
image_speed = 0.5;
spriteIdle = noone;
spriteWalk = noone;
spriteRun = noone;
spriteDead = noone;
spriteAttack[0] = noone;
spriteAttack[1] = noone;

showHealth = false;
showHealthTimer = 0;

barricadeID = noone;

//game manager notify
GameAddZombie();

//cosmetic
//cosmetic = spr_zombieSeasonalHats;
//cosmetic_index = irandom(sprite_get_number(cosmetic));

//debuffs
deBuffPlayerID = noone;
InitDebuffs(id);