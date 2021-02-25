event_inherited();

name = "Spewer";

spriteIdle = spr_speweridle;
spriteWalk = spr_spewerwalk;
spriteAttack[0] = spr_spewermelee;
spriteDead = spr_spewerdead;

damage = SetStat(8, 16, 25, 33);	//old stats (8, 13, 19, 26)
hp = SetStat(16, 20, 24, 32);
maxHp = hp;
moveSpeed = SetZombieSpeed(1);

acid = true;

specialUsed = false;
specialCooldown = 0;
cooldownTime = 10;
specialMinRange = 128;
specialMaxRange = 640;