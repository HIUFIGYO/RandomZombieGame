mask_index = spr_ripperidle;
event_inherited();
mask_index = spr_ripperhitbox;

if(isDead)
	return;

RipperSawBladeAttack();

if(ZombieCheckState(ZombieStateBehaviour))
	ZombieAttack();