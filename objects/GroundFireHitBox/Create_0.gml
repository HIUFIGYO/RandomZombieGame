event_inherited();

fadeOutTime = 2; //seconds
fadeOut = 5;

canPush = false;

targetsHit = ds_list_create();

effect = CreateEffect(x, y, EffectGroundFire);

effect.follow = id;