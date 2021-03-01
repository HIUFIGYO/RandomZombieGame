event_inherited();

if(sprite_index = spr_spewershoot)
{
	sprite_index = !isDead ? spriteIdle : spriteDead;
	specialActive = false;
	specialCooldown = cooldownTime;
	instance_create_layer(id.x, id.y - (id.bbox_bottom - id.bbox_top) / 2, GameManager.layerObject, SpewerProjectile);
}