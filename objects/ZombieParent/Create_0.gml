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


grav = 0.981;
acceleration = random_range(0.1, 0.2);
moveSpeed = 2;
jumpSpeed = 16;
maxFallSpeed = 20;
xSpeed = 0;
ySpeed = 0;
target = noone;
friction = 0.3;

color = c_white;
image_speed = min(moveSpeed * 0.2, 0.5);
image_alpha = 1;
spriteIdle = noone;
spriteWalk = noone;
spriteRun = noone;
spriteDead = noone;
spriteAttack[0] = noone;
spriteAttack[1] = noone;

showHealth = false;
showHealthTimer = 0;

barricadeID = noone;

currentState = ZombieStateDefault;
nextState = noone;
isChangingState = false;

pauseImageSpeed = 0;
previousState = currentState;

GameAddZombie();

deBuffPlayerID = noone;
InitDebuffs();

for(var i=global.playerAmount - 1; i>-1; --i)
{
	killAssistID[i] = noone;
}