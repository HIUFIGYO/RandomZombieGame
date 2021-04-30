///@desc Took Damage

event_inherited();

if(isDead and instance_exists(alphaCreeperID))
{
	alphaCreeperID.creeperDied = id;
	with(alphaCreeperID)
	{
		event_perform(ev_other, ev_user3);
	}
}