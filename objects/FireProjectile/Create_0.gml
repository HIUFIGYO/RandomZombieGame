event_inherited();

moveSpeed = 20;
damage = SetStat(1, 3, 6, 10);
structureDamage = 2;
grav = 0;

image_speed = 0;
image_index = 7;

lifeTimer = 0.5;

effect = CreateEffect(x, y, EffectFlameThrower);
effect.follow = id;