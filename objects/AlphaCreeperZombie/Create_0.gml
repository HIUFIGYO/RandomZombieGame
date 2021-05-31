event_inherited();

if(ZombieIsOnlyMajorThreat())
	AudioStartBoss(Music_Boss2);

name = "Alpha Creeper";
MessageAddAll("Faint creepy groans begin to grow louder...", MessageFilter.SpecialZombie)

spriteIdle = spr_Acreeperidle;
spriteWalk = spr_Acreeperrun;
spriteAttack[0] = spr_Acreeperatk1;
spriteAttack[1] = spr_Acreeperatk2;
spriteDead = spr_Acreeperdead;

damage = SetStat(20, 30, 40, 50);
hp = 10 * (1 + ((global.playerAmount - 1) * 0.4));
maxHp = hp;
moveSpeed = SetZombieSpeed(4);
bounty = (SetStat(120, 83.33, 64.29, 44.44)) * (1 + ((global.playerAmount -1) * 0.4));
attackRange = 8;

speedBonus = 0;

invincible = true;

creeperCount = SetStat(4, 5, 6, 8);
creeperDied = noone;
for(var i=0; i<creeperCount; i++)
{
	creeperID[i] = instance_create_layer(x + irandom_range(-32, 32), y, GameManager.layerZombie, CreeperZombie);
	creeperID[i].alphaCreeperID = id;
	with(creeperID[i])
	{
		while(place_meeting(x, y, BlockParent) or x < 0 or x > room_width)
		{
			x = alphaCreeperID.x + irandom_range(-32, 32);
		}
	}
}