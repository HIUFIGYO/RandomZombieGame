if(InputGetButtonDown(player_inputID, Button.Interact) and reloadTimer[currentWeapon] <= 0)
{
	instance_destroy(other);
	var inst = noone;
	var weapID = noone;
	var weapMag = 0;
	var weapAmmo = 0;
	var type = DataWeapon(other.weapon_id, WeapStat.Type);
	if(type == WeapType.Primary)
	{
		if(weapon[0] != noone)
			{
				weapID = weapon[0];
				weapMag = mag[0];
				weapAmmo = ammo[0];
				inst = instance_create_layer(x, y -64, GameManager.layerObject, WeaponDrops);
			}
		weapon[0] = other.weapon_id;
		mag[0] = other.mag;
		ammo[0] = other.ammo;
	}
	else if(type == WeapType.SideArm)
	{
		if(weapon[1] != noone)
		{
			weapID = weapon[1];
			weapMag = mag[1];
			weapAmmo = ammo[1];
			inst = instance_create_layer(x, y-64, GameManager.layerObject, WeaponDrops);
		}
		weapon[1] = other.weapon_id;
		mag[1] = other.mag;
		ammo[1] = other.ammo;
	}
	else if(type == WeapType.Melee)
	{
		if(meleeWeapon != noone)
		{
			weapID = meleeWeapon;
			inst = instance_create_layer(x, y-64, GameManager.layerObject, WeaponDrops);
		}
		meleeWeapon = other.weapon_id;
	}
	
	if(inst != noone)
	{
		inst.ySpeed = -10;
		inst.xSpeed = irandom_range(-5, 5);
		inst.weapon_id = weapID;
		inst.mag = weapMag;
		inst.ammo = weapAmmo;
		inst.image_index = weapID;
	}
}