/// @description Took Damage
event_inherited();

f(hp <= maxHp * 0.75 and speedBonus == 0)
{
	moveSpeed += 1;
	speedBonus = 1;
}

if(hp <= maxHp * 0.5 and speedBonus == 1)
{
	moveSpeed += 1;
	speedBonus = 2;
}

if(hp <= maxHp * 0.25 and speedBonus == 2)
{
	moveSpeed += 1;
	speedBonus = 3;
}
