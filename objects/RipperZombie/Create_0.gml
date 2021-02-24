event_inherited();

name = "Ripper";

spriteIdle = spr_ripperidle;
spriteWalk = spr_ripperrun;
spriteAttack = spr_ripperatk1;
spriteDead = spr_ripperdead;

damage = SetStat(20, 30, 45, 60);	//old stats (20, 31, 43, 56)
hp = SetStat(50, 60, 70 , 90);		//old stats (100, 120, 140, 180)
maxHp = hp;
moveSpeed = SetZombieSpeed(4);