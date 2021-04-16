event_inherited();

name = "Burster";

spriteIdle = spr_bursteridle;
spriteWalk = spr_bursterwalk;
spriteAttack[0] = spr_bursteratk1;
spriteDead = spr_bursterdead1;

damage = SetStat(8, 15, 23, 32);
hp = SetStat(8, 10, 12, 16);
maxHp = hp;
moveSpeed = SetZombieSpeed(2);

specialUsed = false;