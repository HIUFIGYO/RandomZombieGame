event_inherited();

name = "Burster";

spriteIdle = spr_bursteridle;
spriteWalk = spr_bursterwalk;
spriteAttack[0] = spr_bursteratk1;
spriteDead = spr_bursterdead;

damage = SetStat(8, 16, 25, 33);	//old stats (8, 13, 19, 26)
hp = SetStat(6, 8, 10, 14);
maxHp = hp;
moveSpeed = SetZombieSpeed(2);