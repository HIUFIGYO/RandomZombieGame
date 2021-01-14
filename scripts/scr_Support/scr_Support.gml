enum HealingType
{
	Medicine,
	Syringe,
	MedKit
}

///@function HealingUse(playerFrom, playerTo)

function HealingUse(_playerFrom, _playerTo)
{
	if(_playerFrom.healingItem == noone) return;
	
	HealPlayer(_playerTo, 20);
	
	_playerFrom.healingItemAmount -= 1;
	if(CheckBuff(_playerFrom, Buff.Medic)and random(1) <= DataBase.medicBuffChanceItemNotConsume)
		_playerFrom.healingItemAmount += 1;
	
	if(_playerFrom.healingItemAmount <= 0)
		_playerFrom.healingItem = noone;
}

///@function TraceLaser(id, flip, startX, startY)

function TraceLaser(_id, _flip, _startX, _startY)
{
	var i = 0, inst;
	while(i < 1000)
	{
		i++;
		inst = collision_line(_startX, _startY, _startX + 16 * image_xscale, _startY, BlockParent, false, true);
		if(inst)
		{
			if(_flip > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		inst = collision_line(_startX, _startY, _startX + 16 * image_xscale, _startY, Barricade, false, true);
		if(inst and inst.canCollideBullet and inst.canCollidePlayer)
		{
			if(image_xscale > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		_startX += 16 * image_xscale;
	}
}