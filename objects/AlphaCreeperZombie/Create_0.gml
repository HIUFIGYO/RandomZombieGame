event_inherited();

name = "Alpha Creeper";

spriteIdle = spr_Acreeperidle;
spriteWalk = spr_Acreeperrun;
spriteAttack[0] = spr_Acreeperatk1;
spriteAttack[1] = spr_Acreeperatk2;
spriteDead = spr_Acreeperdead;

damage = SetStat(20, 30, 45, 60);
hp = SetStat(10, 10, 10, 10) * (1 + ((global.playerAmount - 1) * 0.5));;
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
attackRange = 8;

repeat(SetStat(4, 5, 6, 8))
	instance_create_layer(x,y,GameManager.layerZombie, CreeperZombie);