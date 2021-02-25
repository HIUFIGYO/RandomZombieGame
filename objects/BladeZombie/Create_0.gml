event_inherited();

name = "Blade";

spriteIdle = spr_bladeidle;
spriteWalk = spr_bladerun;
spriteAttack[0] = spr_bladeatk1;
spriteAttack[1] = spr_bladeatk2;
spriteDead = spr_bladedead;

damage = SetStat(10, 15, 25, 35);	//old stats (10, 16, 23, 31)
hp = SetStat(14, 17, 20, 26);
maxHp = hp;
moveSpeed = SetZombieSpeed(5);