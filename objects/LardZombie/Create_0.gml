event_inherited();

name = "Lard";

spriteIdle = spr_lardidle;
spriteWalk = spr_lardwalk;
spriteAttack[0] = spr_lardatk1;
spriteDead = spr_larddead;
spriteGibs = spr_lardgibs;

damage = SetStat(6, 12, 19, 27);
structureDamage = 12;
hp = SetStat(6, 8, 10, 14);
maxHp = hp;
moveSpeed = SetZombieSpeed(1);
bounty = 30 * (SetStat(1.2, 1.1, 1, 0.9));
maxBounty = bounty;
attackSpeed = 0.4;

acid = true;