event_inherited();

name = "Stray Creeper";

spriteIdle = spr_Screeperidle;
spriteWalk = spr_Screeperrun;
spriteAttack[0] = spr_Screeperatk1;
spriteAttack[1] = spr_Screeperatk2;
spriteDead = spr_Screeperdead;

damage = SetStat(16, 24, 36, 48);
hp = SetStat(10, 12, 14, 18) * (1 + ((global.playerAmount - 1) * 0.3));;
maxHp = hp;
moveSpeed = SetZombieSpeed(4);

speedBonus = 0;