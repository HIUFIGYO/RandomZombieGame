event_inherited();

name = "Stray Creeper";

spriteIdle = spr_Screeperidle;
spriteWalk = spr_Screeperrun;
spriteAttack = spr_Screeperatk1;
spriteDead = spr_Screeperdead;

damage = SetStat(16, 24, 36, 48);
hp = SetStat(10 * (global.playerAmount - 1) * 1.25,
			 12 * (global.playerAmount - 1) * 1.25,
			 14 * (global.playerAmount - 1) * 1.25,
			 18 * (global.playerAmount - 1) * 1.25);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);