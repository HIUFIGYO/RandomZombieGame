event_inherited();

name = "Injector";

spriteIdle = spr_injectoridle;
spriteWalk = spr_injectorrun;
spriteAttack[0] = spr_injectoratk1;
spriteDead = spr_injectordead;

damage = SetStat(4, 9, 15, 22);
hp = SetStat(12, 15, 18, 24);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);

specialUsed = false;
specialCooldown = 0;
specialCooldownTime = SetStat(12, 10, 8, 6);
specialRange = 128;

clawOffset = 10;
clawPos = clawOffset;
clawSpeed = 4;
clawReturnSpeed = 1;
clawMaxDist = 128;
clawCanGrab = true;
clawDraw = false;

pinButtonMash = 0; // -1 is left, 1 is right, 0 is nuetral
pinButtonCount = 0;

grabTarget = noone;

currentState = ZombieStateInjector;