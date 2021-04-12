event_inherited();

name = "Inferno";
MessageAddAll("The air feels like it's burning...", MessageFilter.SpecialZombie)

spriteIdle = spr_infernoidle;
spriteWalk = spr_infernowalk;
spriteAttack[0] = spr_infernoatk1;
spriteDead = spr_infernodead;

damage = SetStat(20, 30, 40, 50);
hp = SetStat(50, 60, 70 , 90) * (1 + ((global.playerAmount - 1) * 0.5));
maxHp = hp;
moveSpeed = SetZombieSpeed(3);
attackRange = 8;

specialUsed = false;
specialCooldown = 0;
specialAmmo = 20;
specialAmmoMax = specialAmmo;
cooldownTime = SetStat(2, 1.5, 1, 0.5);
specialMinRange = 64;
specialMaxRange = 256;
specialFireRate = 0.1;
specialFireTimer = 0;