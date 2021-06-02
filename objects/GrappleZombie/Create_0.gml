event_inherited();

name = "Grapple";

spriteIdle = spr_grappleidle;
spriteWalk = spr_grapplerun;
spriteAttack[0] = spr_grappleatk1;
spriteDead = spr_grappledead;

damage = SetStat(1, 3, 6, 10);
hp =  SetStat(5, 6, 7, 9);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = 20 * (SetStat(1.2, 1, 0.9, 0.8));
maxBounty = bounty;


grabTarget = noone;
grabX = 0;