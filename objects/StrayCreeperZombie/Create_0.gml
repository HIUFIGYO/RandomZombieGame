event_inherited();

name = "Stray Creeper";

spriteIdle = spr_Screeperidle;
spriteWalk = spr_Screeperrun;
spriteAttack[0] = spr_Screeperatk1;
spriteAttack[1] = spr_Screeperatk2;
spriteDead = spr_Screeperdead;
spriteGibs = spr_Screepergibs;

damage = SetStat(15, 22, 30, 39);
structureDamage = 22;
hp = SetStat(13, 16, 19, 25) * (1 + ((global.playerAmount - 1) * 0.2));
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = (80 * (SetStat(1.2, 1, 0.9, 0.8))) * (1+ ((global.playerAmount -1) * 0.2));
maxBounty = bounty;
attackRange = 8;
attackSpeed = 0.4;

speedBonus = 0;