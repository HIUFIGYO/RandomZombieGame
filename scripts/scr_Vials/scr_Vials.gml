enum VialType
{
	Adrenaline,
	Strength,
	Mimicry,
	Survivalist,
	Rapid,
	TradeOff,
	count
}

///@function CheckVialPositive(player, vial)

function CheckVialPositive(_player, _vial)
{
	if(_player.vial == _vial)
		return _player.vialPositiveTimer > 0;
	return false;
}

///@function CheckVialNegative(player, vial)

function CheckVialNegative(_player, _vial)
{
	if(_player.vial == _vial)
		return _player.vialNegativeTimer > 0;
	return false;
}

///@function DrawVialIcons(player)

function DrawVialIcons(_player)
{
	if(view_current != _player.playerID or !_player.vialActive)
		return;
	
	var _camera = Window.camera[_player.playerID];
	var xx = camera_get_view_x(_camera) + camera_get_view_width(_camera) - 40,
		yy = camera_get_view_y(_camera) +camera_get_view_height(_camera) - 128,
		_index;
	
	if(_player.vialPositiveTimer > 0)
	{
		draw_sprite(spr_vialIcons, _player.vial * 2, xx, yy - 40);
		_index = (_player.vialPositiveTimer / DataBase.vialTimer[_player.vial]) * sprite_get_number(spr_buffDurationRing);
		draw_sprite(spr_buffDurationRing, _index, xx, yy - 40);
	}
	
	if(_player.vialNegativeTimer > 0)
	{
		draw_sprite(spr_vialIcons, _player.vial * 2 + 1, xx, yy);
		_index = (_player.vialNegativeTimer / (DataBase.vialTimer[_player.vial] * 2)) * sprite_get_number(spr_debuffDurationRing);
		draw_sprite(spr_debuffDurationRing, _index, xx, yy);
	}
	else
	{
		draw_sprite(spr_vials, _player.vial, xx, yy);
		_index = (_player.vialCooldown / DataBase.vialCooldown[_player.vial]) * sprite_get_number(spr_debuffDurationRing);
		draw_sprite(spr_debuffDurationRing, _index, xx, yy);
	}
}