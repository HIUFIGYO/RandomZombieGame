event_inherited();

name = "Creeper";

spriteIdle = spr_creeperidle;
spriteWalk = spr_creeperrun;
spriteAttack[0] = spr_creeperatk1;
spriteAttack[1] = spr_creeperatk2;
spriteDead = spr_creeperdead;

damage = SetStat(10, 15, 20, 25);
hp = SetStat(10, 10, 10, 10) * (1 + ((global.playerAmount - 1) * 0.4));
maxHp = hp;
moveSpeed = SetZombieSpeed(5);
attackRange = 8;

protectAlpha = choose(false, true);
switchTargetMin = 3;
switchTargetMax = 5;
switchTimer = random_range(switchTargetMin, switchTargetMax);

alphaCreeperID = noone;

currentState = ZombieStateCreeper;