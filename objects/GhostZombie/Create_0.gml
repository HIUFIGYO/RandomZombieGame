event_inherited();

name = "Ghost";

spriteIdle = spr_ghostidle;
spriteWalk = spr_ghostwalk;
spriteAttack[0] = spr_ghostatk1;
spriteAttack[1] = spr_ghostatk2;
spriteDead = spr_ghostdead;

damage = SetStat(4, 9, 15, 22);
hp = SetStat(4, 5, 6, 8);
maxHp = hp;
moveSpeed = SetZombieSpeed(3);

cloak = SetStat(0.08, 0.06, 0.04, 0.02);

image_alpha = 0;