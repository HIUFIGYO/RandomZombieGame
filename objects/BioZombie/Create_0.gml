event_inherited();

name = "Bio Zombie";

spriteIdle = spr_bioidle;
spriteWalk = spr_biowalk;
spriteAttack[0] = spr_bioatk1;
spriteAttack[1] = spr_bioatk2;
spriteDead = spr_biodead;

damage = SetStat(9, 15, 22, 30);
hp = SetStat(20, 24, 28, 36) * (1 + ((global.playerAmount - 1) * 0.25));
maxHp = hp;
moveSpeed = SetZombieSpeed(3);

radRange = 256;
radDamage = 2;
radTime = 0.5; //seconds
radTimer = 0;
radColor = c_yellow;
