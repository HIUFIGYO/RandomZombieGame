event_inherited();

name = "Stray Creeper";

spriteIdle = spr_Screeperidle;
spriteWalk = spr_Screeperrun;
spriteAttack[0] = spr_Screeperatk1;
spriteAttack[1] = spr_Screeperatk2;
spriteDead = spr_Screeperdead;

damage = SetStat(16, 24, 32, 40);
hp = SetStat(16, 20, 24, 32) * (1 + ((global.playerAmount - 1) * 0.2));
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 8;

speedBonus = 0;