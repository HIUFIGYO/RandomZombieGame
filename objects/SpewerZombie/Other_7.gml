event_inherited();

if(sprite_index = spr_spewershoot)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	specialActive = false;
	specialCooldown = cooldownTime;
	ZombieCreateSpewShot(id);
}