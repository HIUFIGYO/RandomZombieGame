event_inherited();

name = "Creeper";

spriteIdle = spr_creeperidle;
spriteWalk = spr_creeperrun;
spriteAttack[0] = spr_creeperatk1;
spriteAttack[1] = spr_creeperatk2;
spriteDead = spr_creeperdead;

damage = SetStat(10, 15, 20, 25);
hp = 10 * (1 + ((global.playerAmount - 1) * 0.4));
maxHp = hp;
moveSpeed = SetZombieSpeed(5);
bounty = (SetStat(120, 83.33, 64.29, 44.44)) * (1 + ((global.playerAmount -1 ) * 0.4));
maxBounty = bounty;
attackRange = 8;

protectAlpha = choose(false, true);
switchTargetMin = 3;
switchTargetMax = 5;
switchTimer = random_range(switchTargetMin, switchTargetMax);

alphaCreeperID = noone;

currentState = ZombieStateCreeper;