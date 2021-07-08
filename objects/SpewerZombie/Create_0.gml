event_inherited();

name = "Spewer";

spriteIdle = spr_speweridle;
spriteWalk = spr_spewerwalk;
spriteAttack[0] = spr_spewermelee;
spriteDead = spr_spewerdead;
spriteGibs = spr_spewergibs;

damage = SetStat(8, 15, 23, 32);
structureDamage = 15;
hp = SetStat(14, 17, 20, 26);
maxHp = hp;
moveSpeed = SetZombieSpeed(1.5);
bounty = 70 * (SetStat(1.2, 1, 0.9, 0.8));
maxBounty = bounty;
attackRange = 4;
attackSpeed = 0.4;

acid = true;

specialUsed = false;
specialCooldown = 0;
cooldownTime = SetStat(6, 5, 4, 3);
specialMinRange = 128;
specialMaxRange = 640;

currentState = ZombieStateSpewer;