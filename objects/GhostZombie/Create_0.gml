event_inherited();

name = "Ghost";

spriteIdle = spr_ghostidle;
spriteWalk = spr_ghostwalk;
spriteAttack[0] = spr_ghostatk1;
spriteAttack[1] = spr_ghostatk2;
spriteDead = spr_ghostdead;

damage = SetStat(3, 7, 12, 18);
hp = SetStat(4, 5, 6, 8);
maxHp = hp;
moveSpeed = SetZombieSpeed(2.5);

cloak = SetStat(0.1, 0.075, 0.05, 0.025);

image_alpha = 0;