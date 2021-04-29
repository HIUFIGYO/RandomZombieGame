event_inherited();

name = "Ripper";
MessageAddAll("A saw can be heard in the distance...", MessageFilter.SpecialZombie)

spriteIdle = spr_ripperidle;
spriteWalk = spr_ripperrun;
spriteAttack[0] = spr_ripperatk1;
spriteAttack[1] = spr_ripperatk2;
spriteDead = spr_ripperdead;

damage = SetStat(20, 30, 40, 50);
hp = SetStat(50, 60, 70 , 90) * (1 + ((global.playerAmount - 1) * 0.5));
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 16;

specialUsed = false;
specialCooldown = 0;
cooldownTime = SetStat(8, 7, 6, 5);

currentState = ZombieStateBehaviour;