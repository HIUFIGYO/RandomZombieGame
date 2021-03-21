event_inherited();

name = "Spewer";

spriteIdle = spr_speweridle;
spriteWalk = spr_spewerwalk;
spriteAttack[0] = spr_spewermelee;
spriteDead = spr_spewerdead;

damage = SetStat(8, 15, 23, 32);
hp = SetStat(16, 20, 24, 32);
maxHp = hp;
moveSpeed = SetZombieSpeed(1.5);
attackRange = 4;

acid = true;

specialUsed = false;
specialCooldown = 0;
cooldownTime = SetStat(6, 5, 4, 3);
specialMinRange = 128;
specialMaxRange = 640;