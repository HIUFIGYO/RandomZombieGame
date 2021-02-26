event_inherited();

name = "Twitcher";

spriteIdle = spr_twitcheridle;
spriteWalk = spr_twitcherrun;
spriteAttack[0] = spr_twitcheratk1;
spriteDead = spr_twitcherdead;

damage = SetStat(1, 3, 6, 10);	//old stats (2, 3, 5, 8)
hp = SetStat(10, 12, 14, 18);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 4;