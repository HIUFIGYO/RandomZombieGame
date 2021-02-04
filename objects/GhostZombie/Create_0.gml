event_inherited();

name = "Ghost";

spriteIdle = spr_ghostidle;
spriteWalk = spr_ghostwalk;
spriteAttack = spr_ghostatk1;
spriteDead = spr_ghostdead;

damage = SetStat(4, 9, 15, 22);
hp = SetStat(4, 5, 6, 8);
maxHp = hp;
moveSpeed = SetZombieSpeed(3);

cloak = SetStat(0.1, 0.075, 0.05, 0.025);

image_alpha = 0;