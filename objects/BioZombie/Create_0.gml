event_inherited();

name = "Bio Zombie";

spriteIdle = spr_bioidle;
spriteWalk = spr_biowalk;
spriteAttack[0] = spr_bioatk1;
spriteAttack[1] = spr_bioatk2;
spriteDead = spr_biodead;
spriteGibs = spr_biogibs;

damage = SetStat(9, 15, 22, 30);
structureDamage = 15;
hp = SetStat(20, 24, 28, 36) * (1 + ((global.playerAmount - 1) * 0.2));
maxHp = hp;
moveSpeed = SetZombieSpeed(3);
bounty = (100 * (SetStat(1.2, 1, 0.9, 0.8))) * (1+ ((global.playerAmount -1) * 0.2));
maxBounty = bounty;
attackSpeed = 0.5;

hasRad = true;
radRange = 6 * global.worldUnit;//radius in world units;
radDamage = 2;
radTime = 0.5; //seconds
radTimer = 0;
radColor = c_yellow;

currentState = ZombieStateBio;