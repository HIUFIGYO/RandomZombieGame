event_inherited();

name = "Grapple";

spriteIdle = spr_grappleidle;
spriteWalk = spr_grapplerun;
spriteAttack[0] = spr_grappleatk1;
spriteDead = spr_grappledead;

damage = SetStat(1, 3, 6, 10);
hp =  SetStat(24, 22, 22, 20);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = 20 * (SetStat(1.2, 1, 0.9, 0.8));

grabTarget = noone;
grabX = 0;