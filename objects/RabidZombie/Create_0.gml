event_inherited();

name = "Rabid";

spriteIdle = spr_rabididle;
spriteWalk = spr_rabidrun;
spriteAttack = spr_rabidatk1;
spriteDead = spr_rabiddead;

damage = SetStat(3, 7, 12, 18);
hp =  SetStat(3, 4, 5, 7);
maxHp = hp;
moveSpeed = SetZombieSpeed(5);