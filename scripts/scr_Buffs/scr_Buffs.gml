enum Buff
{
	Regeneration,
	Health,
	Resistance,
	Stamina,
	Agility,
	Reload,
	Ammo,
	Damage,
	Critical,
	Scout,
	Medic,
	Demo,
	count
}

enum DeBuff
{
	Ignite,
	Acid,
	Bleed,
	Poison,
	count
}

///@function CheckBuff(player, buff)

function CheckBuff(_player, _buff)
{
	return(_player.buff[0] == _buff or _player.buff[1] == _buff);
}

///@function GetBuffSlot(player, buff)

function GetBuffSlot(_player, _buff)
{
	if(_player.buff[0] == _buff)
		return 0;
	return 1;
}

///@function InitDebuffs(id)

function InitDebuffs(_id)
{
	for(var i=0; i<DeBuff.count; i++)
	{
		_id.deBuff[i] = false;
		_id.deBuffStack[i] = 0;
		_id.deBuffTimer[i] = 0;
	}
}

///@function DebuffApply(id, debuff, playerIDoptional)

function DebuffApply(_id, _debuff, _playerID)
{
	if(!is_undefined(_playerID))
		_id.deBuffPlayerID = _playerID;
	
	if(_id.deBuff[_debuff])
	{
		switch(_debuff)
		{
			case DeBuff.Ignite:
				_id.deBuffStack[_debuff] += 1;
				_id.deBuffTimer[_debuff] = DataBase.deBuffDuration[_debuff];
				break;
				
			case DeBuff.Acid:
				_id.deBuffTimer[_debuff] = DataBase.deBuffDuration[_debuff];
				break;
				
			case DeBuff.Bleed:
				_id.deBuffStack[_debuff] += 1;
				_id.deBuffTimer[_debuff] += 2;
				if(is_undefined(_playerID))
					_id.bleedMaxTimer += 2;
				break;
		}
	}
	else
	{
		_id.deBuff[_debuff] = true;
		_id.deBuffStack[_debuff] = 1;
		_id.deBuffTimer[_debuff] = DataBase.deBuffDuration[_debuff];
		if(_debuff == DeBuff.Bleed)
		{
			_id.deBuffStack[_debuff] = 2;
			if(is_undefined(_playerID))
				_id.bleedMaxTimer = DataBase.deBuffDuration[_debuff];
		}
	}
}

///@function UpdateDebuffs(id, isPlayer)

function UpdateDebuffs(_id, _isPlayer)
{
	for(var i=0; i<DeBuff.count; i++)
	{
		if(!_id.deBuff[i])
			continue;
			
		var doDamage = floor(_id.deBuffTimer[i]);
		_id.deBuffTimer[i] -= DeltaTimeSecond();
		if(_id.deBuffTimer[i] < 0)
			_id.deBuffTimer[i] = 0;
		if(doDamage != floor(_id.deBuffTimer[i]))
		{
			switch(i)
			{
				case DeBuff.Ignite:
				case DeBuff.Bleed:
					if(_isPlayer)
						DamagePlayer(_id, _id.deBuffStack[i]);
					else
					{
						if(deBuffPlayerID != noone)
							DamageZombie(deBuffPlayerID, _id, _id.deBuffStack[i]);
					}
					break;
					
				case DeBuff.Acid:
					if(_isPlayer)
						DamagePlayer(_id, DataBase.deBuffDamage[i]);
					else
					{
						if(deBuffPlayerID != noone)
							DamageZombie(deBuffPlayerID, _id, DataBase.deBuffDamage[i]);
					}
					break;
					
				case DeBuff.Poison:
					break;
			}
		}
		
		if(_id.deBuffTimer[i] <= 0)
		{
			_id.deBuff[i] = false;
			_id.deBuffStack[i] = 0;
			if(i == DeBuff.Poison)
				DamagePlayerHealth(_id, SetStat(DataBase.deBuffDamageEasy, DataBase.deBuffDamageMed, DataBase.deBuffDamageHard, DataBase.deBuffDamageVeryHard));
		}
	}
}

///@function DrawDebuffs(id, view)

function DrawDebuffs(_id, _view)
{
	if(view_current != _view)
		return;
	
	var _width = 0,
		_count = 0,
		_padding = 8,
		_sprWidth = sprite_get_width(spr_debuffs),
		_startX = camera_get_view_x(Window.camera[_view]) + camera_get_view_width(Window.camera[_view])/2,
		_startY = camera_get_view_y(Window.camera[_view]) + camera_get_view_height(Window.camera[_view]) - _sprWidth - _padding,
		_deBuffIcon = [],
		i;
	
	for(i=0; i<DeBuff.count; i++)
	{
		if(_id.deBuff[i])
		{
			_deBuffIcon[_count] = i;
			_count ++;
			_width += _sprWidth + _padding * 2;
		}
	}
	
	for(i=0; i<_count; i++)
	{
		var _xx = _startX - (_width / 2) + i * (_sprWidth + _padding) + _padding;
		draw_sprite(spr_debuffs, _deBuffIcon[i], _xx, _startY);
		
		var _stackCorrect = _id.deBuffStack[_deBuffIcon[i]];
		var _maxDuration = DataBase.deBuffDuration[_deBuffIcon[i]];
		if(_deBuffIcon[i] == DeBuff.Bleed)
		{
			_stackCorrect -= 1;
			_maxDuration = _id.bleedMaxTimer;
		}
		
		var index = (_id.deBuffTimer[_deBuffIcon[i]] / _maxDuration) * sprite_get_number(spr_debuffDurationRing);
		draw_sprite(spr_debuffDurationRing, floor(index), _xx, _startY);
		
		if(_stackCorrect > 1)
		{
			draw_set_color(c_yellow);
			draw_set_alpha(1);
			draw_text(_xx, _startY, string(_stackCorrect));	
		}
	}
}