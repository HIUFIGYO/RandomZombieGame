event_inherited();

name = "Grapple";

spriteIdle = spr_grappleidle;
spriteWalk = spr_grapplerun;
spriteAttack[0] = spr_grappleatk1;
spriteDead = spr_grappledead;
spriteGibs = spr_grapplegibs;

damage = SetStat(1, 3, 6, 10);
structureDamage = 3;
hp =  SetStat(5, 6, 7, 9);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = 20 * (SetStat(1.3, 1.1, 1, 0.9));
maxBounty = bounty;
attackSpeed = 0.4;


grabTarget = noone;
grabX = 0;