/// @description Post Create Event

switch(weapon)
{
	case Weapon.Pistol2:
	case Weapon.Rifle2:
	case Weapon.Pistol3:
		color = c_orange;
		break;
		
	case Weapon.Shotgun:
	case Weapon.Shotgun2:
	case Weapon.Shotgun3:
		color = c_gray;
		break;
		
	case Weapon.Flame:
		visible = false;
		effect = CreateEffect(x, y, EffectFlameThrower);
		effect.follow = id;
		break;
		
	case Weapon.Tesla:
		visible = false;
		effect = CreateEffect(x, y, EffectTeslaShot);
		effect.follow = id;
		break;
		
	case Weapon.Purple:
		color = c_purple;
		
	case Weapon.Drainer:
		color = c_white;
		break;
		
	case Weapon.BHDarker:
		visible = false;
		effect = CreateEffect(x, y, EffectBHShot);
		effect.follow = id;
		break;
}