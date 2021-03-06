event_inherited();

name = "Ghost";

spriteIdle = spr_ghostidle;
spriteWalk = spr_ghostwalk;
spriteAttack[0] = spr_ghostatk1;
spriteAttack[1] = spr_ghostatk2;
spriteDead = spr_ghostdead;
spriteGibs = spr_ghostgibs;

damage = SetStat(3, 7, 12, 18);
structureDamage = 7;
hp = SetStat(4, 5, 6, 8);
maxHp = hp;
moveSpeed = SetZombieSpeed(2.5);
bounty =  25 * (SetStat(1.2, 1, 0.9, 0.8));
maxBounty = bounty;
attackSpeed = 0.375;


cloak = SetStat(0.1, 0.08, 0.06, 0.05);
deCloakDamage = false;

image_alpha = 0;