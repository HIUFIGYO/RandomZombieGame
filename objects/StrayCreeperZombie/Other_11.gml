/// @description Took Damage
event_inherited();

if(hp <= maxHp * 0.75 and speedBonus == 0)
{
	MessageAddAll("Speed Boost1", MessageFilter.Debug);
	moveSpeed += 1;
	speedBonus = 1;
}

if(hp <= maxHp * 0.5 and speedBonus == 1)
{
	MessageAddAll("Speed Boost2", MessageFilter.Debug);
	moveSpeed += 1;
	speedBonus = 2;
}

if(hp <= maxHp * 0.25 and speedBonus == 2)
{
	MessageAddAll("Speed Boost3", MessageFilter.Debug);
	moveSpeed += 1;
	speedBonus = 3;
}