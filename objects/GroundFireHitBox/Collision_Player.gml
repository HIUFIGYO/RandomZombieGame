if(!CheckVialNegative(other, VialType.Mimicry))
{
	if(other.id != playerID)
		exit;
}

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
	DamagePlayer(other, DataBase.incendiaryGroundFire * SetStat(0.5, 1, 2, 4), "FriendlyFire", other.name);
	if(random(1) <= DataBase.incendiaryIgniteChance / 2)
	{
		DebuffApply(other, DeBuff.Ignite);
	}
}