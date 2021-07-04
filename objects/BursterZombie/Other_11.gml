///@desc Took Damage

event_inherited();

if(!specialUsed and hp <= maxHp / 2 and !isDead)
{
	startSpecial = true;
}
