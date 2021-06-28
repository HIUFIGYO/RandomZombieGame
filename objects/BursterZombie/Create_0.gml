event_inherited();

name = "Burster";

spriteIdle = spr_bursteridle;
spriteWalk = spr_bursterwalk;
spriteAttack[0] = spr_bursteratk1;
spriteDead = spr_bursterdead1;
spriteGibs = spr_burstergibs1;

damage = SetStat(8, 15, 23, 32);
structureDamage = 15;
hp = SetStat(8, 10, 12, 16);
maxHp = hp;
moveSpeed = SetZombieSpeed(2);
bounty =  40 * (SetStat(1.2, 1, 0.9, 0.8));
maxBounty = bounty;
attackSpeed = 0.4;


specialUsed = false;