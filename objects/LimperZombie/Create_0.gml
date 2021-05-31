event_inherited();

name = "Limper";

spriteIdle = spr_limperidle;
spriteWalk = spr_limperwalk;
spriteAttack[0] = spr_limperatk1;
spriteAttack[1] = spr_limperatk2;
spriteDead = spr_limperdead;

damage = SetStat(2, 5, 9, 14);
hp = SetStat(4, 5, 6, 8);
maxHp = hp;
moveSpeed = SetZombieSpeed(2);
bounty =  15 * (SetStat(1.2, 1, 0.9, 0.8));