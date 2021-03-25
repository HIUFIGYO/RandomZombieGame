var doDamage = true;

for(var i=0; i<ds_list_size(targetsHit);  i++)
{
	if(targetsHit[| i] == other)
	{
		doDamage = false;
		break;
	}
}

if(doDamage)
{
	ds_list_add(targetsHit, other);
	DamageZombie(playerID, other, DataBaseIncendiaryGroundFire());
	if(random(1) <= DataBaseIncendiaryIgniteChance())
	{
		DebuffApply(other, DeBuff.Ignite, playerID);
	}
}