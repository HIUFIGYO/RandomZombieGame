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

cloak = SetStat(0.1, 0.07, 0.04, 0.01);

image_alpha = 0;