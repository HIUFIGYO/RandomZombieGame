event_inherited();

name = "Lard";

spriteIdle = spr_lardidle;
spriteWalk = spr_lardwalk;
spriteAttack[0] = spr_lardatk1;
spriteDead = spr_larddead;

damage = SetStat(6, 12, 19, 27);	//old stats (6, 10, 15, 21)
hp =  SetStat(8, 10, 12, 16);
maxHp = hp;
moveSpeed = SetZombieSpeed(1);

acid = true;