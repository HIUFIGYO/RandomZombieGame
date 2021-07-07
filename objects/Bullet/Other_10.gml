/// @description Post Create Event

switch(weapon)
{
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
}