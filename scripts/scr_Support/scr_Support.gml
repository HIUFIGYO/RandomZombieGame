///@function TurretShoot(turret)

function TurretShoot(_turret)
{
	var inst = instance_create_layer(_turret.x + sprite_get_width(_turret.sprite_index) * _turret.image_xscale, _turret.y - _turret.yoffSet, GameManager.layerObject, Bullet);
	inst.playerID = _turret.playerID;
	inst.weapon = Weapon.Rifle;
	inst.spd = 64;
	inst.rangeTimer = DataBaseGetWeapon(inst.weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
	inst.pierce = 1;
	inst.ignoreBuffs = true;
	inst.image_xscale = _turret.image_xscale;
	inst.image_index = DataBaseGetWeapon(inst.weapon, WeapStat.BulletImage);

	var bulletAngle = irandom((1 - _turret.accuracy) * 90);
	inst.xSpeed = cos(bulletAngle * pi / 180) * _turret.image_xscale;
	inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
}

///@function TraceLaser(flip, startX, startY)

function TraceLaser(_flip, _startX, _startY)
{
	var i = 0, inst;
	while(i < 1000)
	{
		i += 5;
		inst = collision_line(_startX, _startY, _startX + 16 * _flip, _startY, BlockParent, false, true);
		if(inst)
		{
			if(_flip > 0)
				return inst.bbox_left;
			return inst.bbox_right;
		}
	
		inst = collision_line(_startX, _startY, _startX + 16 * _flip, _startY, Barricade, false, true);
		if(inst and inst.canCollideBullet and inst.canCollidePlayer)
		{
			if(_flip > 0)
				return inst.bbox_left;
			return inst.bbox_right;
		}
	
		_startX += 16 * _flip;
	}
	
	if(_flip > 0)
		return room_width;
	return 0;
}
