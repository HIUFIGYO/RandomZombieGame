event_inherited();

if(ZombieIsOnlyMajorThreat())
	AudioStartBoss(Music_Boss1);

name = "Ripper";
MessageAddAll("A saw can be heard in the distance...", MessageFilter.SpecialZombie)

spriteIdle = spr_ripperidle;
spriteWalk = spr_ripperrun;
spriteAttack[0] = spr_ripperatk1;
spriteAttack[1] = spr_ripperatk2;
spriteDead = spr_ripperdead;
spriteGibs = spr_rippergibs;

damage = SetStat(20, 30, 40, 50);
structureDamage = 30;
hp = SetStat(50, 60, 70 , 90) * (1 + ((global.playerAmount - 1) * 0.4));
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = (500 * (SetStat(1.2, 1, 0.9, 0.8))) * (1+ ((global.playerAmount - 1) * 0.4));
maxBounty = bounty;
attackRange = 16;
attackSpeed = 0.4;

specialUsed = false;
specialCooldown = 0;
cooldownTime = SetStat(6, 5, 4, 3);
sawDamage = SetStat(2, 5, 9, 14);

currentState = ZombieStateRipper;