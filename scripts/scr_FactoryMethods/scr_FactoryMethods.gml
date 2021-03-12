///@function CreateHitBox(playerID, x, y, sprite, subImage, damage)

function CreateHitBox(_player, _x, _y, _sprite, _subImage, _damage)
{
	var inst = instance_create_layer(_x, _y, UIController.layerUI, HitBox);
	inst.playerID = _player;
	inst.sprite_index = _sprite;
	inst.image_speed = 0;
	inst.image_index = _subImage;
	inst.damage = _damage;
	return inst;
}

///@function CreateGrenade(player)

function CreateGrenade(_player)
{
	var inst = instance_create_layer(_player.x, _player.y - 40, GameManager.layerObject, Grenade);
	inst.xSpeed = _player.image_xscale * 16;
	inst.ySpeed = -10;
	inst.grenadeType = _player.grenadeType;
	inst.playerID = _player;
	inst.pierce = DataBase.explosionPierce[inst.grenadeType];
	with(inst)
		event_perform(ev_other, ev_user0);
}

///@function CreateExplosion(instance, playerID)

function CreateExplosion(_instance, _playerID, _explosionType)
{
	var inst = instance_create_layer(_instance.x, _instance.y, GameManager.layerObject, Explosion);
	inst.playerID = _playerID;
	inst.grenadeType = _explosionType;
	inst.sprite_index = ExplosionGetSize(_explosionType);
	if(_explosionType == ExplosionType.Acid)
		inst.acid = true;
}

///@function CreateGroundFire(player, x, y, amount)

function CreateGroundFire(_player, _x, _y, _amount)
{
	repeat(_amount)
	{
		var inst = instance_create_layer(_x, _y, GameManager.layerObject, GroundFireHitBox);
		inst.playerID = _player;
		inst.xSpeed = irandom_range(-10, 10);
		inst.ySpeed = -irandom_range(4, 10);
	}
}

///@function CreateBullet(id, x, y, weapon, flip, isCrouching)

function CreateBullet(_id, xx, yy, _weapon, flip, crouch)
{
	var _burst = DataBaseGetWeapon(_weapon, WeapStat.Burst);
	if(_burst > 1 and CheckBuff(_id, Buff.Damage))
		_burst += DataBase.damageBuffShotgun;
	
	repeat(_burst)
	{
		var xoff = DataBaseGetWeapon(_weapon, WeapStat.xOffset) * flip;
		var yoff = DataBaseGetWeapon(_weapon, WeapStat.yOffset);
		var inst = instance_create_layer(xx + xoff, yy - yoff, GameManager.layerObject, Bullet);
		inst.playerID = _id;
		inst.weapon = _weapon;
		inst.spd = DataBaseGetWeapon(_weapon, WeapStat.BulletSpeed);
		inst.rangeTimer = DataBaseGetWeapon(_weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
		inst.pierce = DataBaseGetWeapon(_weapon, WeapStat.Pierce);
		inst.image_xscale = flip;
		inst.image_index = DataBaseGetWeapon(_weapon, WeapStat.BulletImage);
		
		var accuracy = DataBaseGetWeapon(_weapon, WeapStat.Accuracy);
		if(crouch)
			accuracy *= 1.05;
		accuracy = clamp(accuracy, 0, 0.97);
		var bulletAngle = irandom((1 - accuracy) * 90);
		inst.xSpeed = cos(bulletAngle * pi / 180) * flip;
		inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
	}
}

///@function CreateSupportItem(player)

function CreateSupportItem(_player)
{
	var _inst = instance_create_layer(_player.x+_player.supportXOffset * _player.image_xscale, _player.y+_player.supportYOffset, GameManager.layerObject, DataBaseSupportGetObject(_player.supportItem));
	_inst.image_xscale = _player.image_xscale;
	_inst.playerID = _player;
	if(_player.supportItem == SupportType.Turret)
		_inst.laserColor = _player.head_color;
}