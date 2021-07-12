event_inherited();

if(ZombieIsOnlyMajorThreat())
	AudioStartBoss(Music_Boss3);

name = "Inferno";
MessageAddAll("The air feels like it's burning...", MessageFilter.SpecialZombie)

spriteIdle = spr_infernoidle;
spriteWalk = spr_infernowalk;
spriteAttack[0] = spr_infernoatk1;
spriteDead = spr_infernodead;
spriteGibs = spr_infernogibs;

damage = SetStat(20, 30, 40, 50);
structureDamage = 30;
hp = SetStat(45, 54, 63 , 81) * (1 + ((global.playerAmount - 1) * 0.4));
maxHp = hp;
moveSpeed = SetZombieSpeed(3.5);
bounty = (500 * (SetStat(1.2, 1, 0.9, 0.8))) * (1+ ((global.playerAmount - 1) * 0.4));
maxBounty = bounty;
attackRange = 8;
attackSpeed = 0.4;

specialUsed = false;
specialCooldown = 0;
specialAmmo = 20;
specialAmmoMax = specialAmmo;
cooldownTime = SetStat(3, 2.5, 2, 1.5);
specialMinRange = 64;
specialMaxRange = 256;
specialFireRate = 0.1;
specialFireTimer = 0;

currentState = ZombieStateInferno;