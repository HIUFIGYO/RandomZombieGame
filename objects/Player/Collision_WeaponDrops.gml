if(InputGetButtonDown(player_inputID, Button.Interact))
{
	instance_destroy(other);
	var inst = noone;
	var weapID = noone;
	var type = DataWeapon(other.weapon_id, WeapStat.Type);
	if(type == WeapType.Primary)
	{
		if(weapon[0] != noone)
			{
				weapID = weapon[0];
				inst = instance_create_layer(x, y -100, "Instances", WeaponDrops);
			}
		weapon[0] = other.weapon_id;
	}
	else if(type == WeapType.SideArm)
	{
		if(weapon[1] != noone)
		{
			weapID = weapon[1];
			inst = instance_create_layer(x, y-100, "Instances", WeaponDrops);
		}
		weapon[1] = other.weapon_id;
	}
	else if(type == WeapType.Melee)
	{
		if(meleeWeapon != noone)
		{
			weapID = meleeWeapon;
			inst = instance_create_layer(x, y-100, "Instances", WeaponDrops);
		}
		meleeWeapon = other.weapon_id;
	}
	
	if(inst != noone)
	{
		inst.vspeed = -10;
		inst.hspeed = irandom_range(-5, 5);
		inst.weapon_id = weapID;
		inst.image_index = weapID;
	}
}