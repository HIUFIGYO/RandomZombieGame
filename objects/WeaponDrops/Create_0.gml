event_inherited();
image_speed = 0;

weapon_id = irandom(Weapon.count);
ammo = DataWeapon(weapon_id, WeapStat.Ammo);
mag = DataWeapon(weapon_id, WeapStat.Mag);

image_index = weapon_id;