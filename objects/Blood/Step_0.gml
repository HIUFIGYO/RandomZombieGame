if(GamePaused())
	return;

ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

x += xSpeed * DeltaTime();
y += ySpeed * DeltaTime();

if(place_meeting(x, y, BlockParent))
{
	instance_destroy();
	return;
}

var inst = instance_place(x, y, Barricade);
	
if(inst and inst.canCollideZombie)
{
	DamageSupport(inst, 1);
	dontDraw = true;
	instance_destroy();
	return;
}

inst = instance_place(x, y, Player);

if(inst)
{
	if(!isAcid)
		return;

	var _damage = SetStat(0, 1, 2, 4);

	if(inst.armour > 0)
		DamagePlayerArmour(inst, _damage * 2);
	else
		DamagePlayer(inst, _damage, "Acid");
	
	DebuffApply(inst, DeBuff.Acid);
	dontDraw = true;
	instance_destroy();
	return;
}

inst = instance_place(x, y, ZombieParent);

if(inst)
{
	if(!isAcid or IsDead(inst)or inst.acid)
		return;
	
	DebuffApply(inst, DeBuff.Acid, noone);
	dontDraw = true;
	instance_destroy();
}