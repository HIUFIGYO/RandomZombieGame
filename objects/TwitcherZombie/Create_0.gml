event_inherited();

name = "Twitcher";

spriteIdle = spr_twitcheridle;
spriteWalk = spr_twitcherrun;
spriteAttack[0] = spr_twitcheratk1;
spriteDead = spr_twitcherdead;

damage = SetStat(2, 5, 9, 14);
hp = SetStat(10, 12, 14, 18);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 4;

dodgeUsed = false;
dodgeCooldownTime = SetStat(2.5, 2, 1.5, 1);
dodgeCooldown = 0;

pounceUsed = false;
pounceDistance = 5 * global.worldUnit;
pounceCooldownTime = SetStat(7, 6, 5, 4);
pounceCooldown = 0;

pinDamage = SetStat(1, 3, 6, 10)
pinButtonMash = 0; // -1 is left, 1 is right, 0 is nuetral
pinButtonCount = 0;
grabTarget = noone;

currentState = ZombieStateTwitcher;