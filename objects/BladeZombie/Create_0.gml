event_inherited();

name = "Blade";

spriteIdle = spr_bladeidle;
spriteWalk = spr_bladerun;
spriteAttack = spr_bladeatk1;
spriteDead = spr_bladedead;

damage = SetStat(10, 16, 23, 31);
hp = SetStat(14, 17, 20, 26);
maxHp = hp;
moveSpeed = SetZombieSpeed(5);