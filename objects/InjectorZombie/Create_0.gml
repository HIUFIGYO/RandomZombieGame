event_inherited();

name = "Injector";

spriteIdle = spr_injectoridle;
spriteWalk = spr_injectorrun;
spriteAttack[0] = spr_injectoratk1;
spriteDead = spr_injectordead;

damage = SetStat(4, 9, 15, 22);
hp = SetStat(12, 15, 18, 24);
maxHp = hp;
moveSpeed = SetZombieSpeed(4);