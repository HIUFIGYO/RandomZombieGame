event_inherited();

name = "Injector";

spriteIdle = spr_injectoridle;
spriteWalk = spr_injectorrun;
spriteAttack[0] = spr_injectoratk1;
spriteDead = spr_injectordead;
spriteGibs = spr_injectorgibs;

damage = SetStat(4, 9, 15, 22);
structureDamage = 9;
hp = SetStat(12, 15, 18, 24);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = 60 * (SetStat(1.2, 1, 0.9, 0.8));
maxBounty = bounty;
attackSpeed = 0.5;


specialUsed = false;
specialCooldown = 0;
specialCooldownTime = SetStat(12, 10, 8, 6);
specialRange = SetStat(128, 128, 160, 192);

clawOffset = 10;
clawPos = clawOffset;
clawSpeed = SetStat(4, 4, 5, 5);
clawReturnSpeed = SetStat(1, 1, 1.5, 1.5);
clawMaxDist = SetStat(128, 160, 192, 224);
clawCanGrab = true;
clawDraw = false;

pinButtonMash = 0; // -1 is left, 1 is right, 0 is nuetral
pinButtonCount = 0;

grabTarget = noone;

currentState = ZombieStateInjector;