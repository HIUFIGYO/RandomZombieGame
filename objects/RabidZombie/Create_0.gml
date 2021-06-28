event_inherited();

name = "Rabid";

spriteIdle = spr_rabididle;
spriteWalk = spr_rabidrun;
spriteAttack[0] = spr_rabidatk1;
spriteAttack[1] = spr_rabidatk2;
spriteDead = spr_rabiddead;
spriteGibs = spr_rabidgibs;

damage = SetStat(3, 7, 12, 18);
structureDamage = 7;
hp =  SetStat(3, 4, 5, 7);
maxHp = hp;
moveSpeed = SetZombieSpeed(5);
bounty =  20 * (SetStat(1.3, 1.1, 1, 0.9));
maxBounty = bounty;
attackSpeed = 0.4;