event_inherited();

name = "Blade";

spriteIdle = spr_bladeidle;
spriteWalk = spr_bladerun;
spriteAttack[0] = spr_bladeatk1;
spriteAttack[1] = spr_bladeatk2;
spriteDead = spr_bladedead;

damage = SetStat(10, 17, 25, 34);
hp = SetStat(14, 17, 20, 26) * (1 + ((global.playerAmount - 1) * 0.25));
maxHp = hp;
moveSpeed = SetZombieSpeed(4.5);
attackRange = 16;

structureBonusDamage = 1.5;