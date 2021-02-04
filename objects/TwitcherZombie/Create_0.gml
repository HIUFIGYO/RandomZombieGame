event_inherited();

name = "Twitcher";

spriteIdle = spr_twitcheridle;
spriteWalk = spr_twitcherrun;
spriteAttack = spr_twitcheratk1;
spriteDead = spr_twitcherdead;

damage = SetStat(2, 3, 5, 8);
hp = SetStat(10, 12, 14, 18);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);