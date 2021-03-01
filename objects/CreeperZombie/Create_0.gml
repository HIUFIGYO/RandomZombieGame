event_inherited();

name = "Creeper";

spriteIdle = spr_creeperidle;
spriteWalk = spr_creeperrun;
spriteAttack[0] = spr_creeperatk1;
spriteAttack[1] = spr_creeperatk2;
spriteDead = spr_creeperdead;

damage = SetStat(20, 30, 45, 60);
hp = SetStat(10, 10, 10, 10) * (1 + ((global.playerAmount - 1) * 0.5));;
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 8;