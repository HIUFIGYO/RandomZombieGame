event_inherited();

name = "Alpha Creeper";
MessageAddAll("Faint creepy groans begin to grow louder...", MessageFilter.SpecialZombie)

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

invincible = true;

creeperCount = SetStat(4, 5, 6, 8);
creeperDied = noone;
for(var i=0; i<creeperCount; i++)
{
	creeperID[i] = instance_create_layer(x + irandom_range(-32, 32), y, GameManager.layerZombie, CreeperZombie);
	creeperID[i].alphaCreeperID = id;
}