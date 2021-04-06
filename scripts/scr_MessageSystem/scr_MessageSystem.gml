enum MessageFilter
{
	PlayerDown = 1,
	PlayerKill = 2,
	SpecialZombie = 4,
	Notification = 8,
	Debug = 16
}

///@function MessageCheckFilter(messageController, filter)

function MessageCheckFilter(_messageController, _filter)
{
	return _messageController.messageFilter & _filter == _filter;
}

///@function MessageAddAll(message, filter)

function MessageAddAll(_message, _filter)
{
	if(is_undefined(_filter))
		_filter = MessageFilter.Debug;
	
	var _player = noone;
	for(var i=0; i<global.playerAmount; i++)
	{
		_player = instance_find(Player, i);
		
		if(MessageControllerFull(_player.messageController))
		{
			ds_list_delete(_player.messageController.messageList, 0);
			ds_list_delete(_player.messageController.messageColor, 0);
		}
		
		if(MessageCheckFilter(_player.messageController, _filter))
		{
			var _color = MessageGetColor(_filter);
			ds_list_add(_player.messageController.messageList, _message);
			ds_list_add(_player.messageController.messageColor, _color);
		}
	}
}

///@function MessageAddPlayer(player, message, filter)

function MessageAddPlayer(_player, _message, _filter)
{
	if(is_undefined(_filter))
		_filter = MessageFilter.Debug;
	
	if(MessageControllerFull(_player.messageController))
	{
		ds_list_delete(_player.messageController.messageList, 0);
		ds_list_delete(_player.messageController.messageColor, 0);
	}
	
	if(MessageCheckFilter(_player.messageController, _filter))
	{
		var _color = MessageGetColor(_filter);
		ds_list_add(_player.messageController.messageList, _message);
		ds_list_add(_player.messageController.messageColor, _color);
	}
}

///@function MessageGetColor(messageFilter)
function MessageGetColor(_messageFilter)
{
	switch(_messageFilter)
	{
		case MessageFilter.PlayerDown:
			return c_red;
		case MessageFilter.PlayerKill:
			return c_white;
		case MessageFilter.SpecialZombie:
			return c_orange;
		case MessageFilter.Notification:
			return c_aqua;
		case MessageFilter.Debug:
			return c_lime;
	}
	
	return c_white;
}

///@function MessageAddFilter(messageController, filter)

function MessageAddFilter(_messageController, _filter)
{
	if(!MessageCheckFilter(_messageController, _filter))
		_messageController.messageFilter += _filter;
}

///@function MessageRemoveFilter(messageController, filter)

function MessageRemoveFilter(_messageController, _filter)
{
	if(MessageCheckFilter(_messageController, _filter))
		_messageController.messageFilter -= _filter;
}

///@function MessageControllerFull(messageController)

function MessageControllerFull(_messageController)
{
	return ds_list_size(_messageController.messageList) == _messageController.messageMaxSize;
}

///@function MessageGetDamageTag(tag)

function MessageGetDamageTag(_tag)
{
	switch(_tag)
	{
		case "Acid":
			return "'s skin melted off";
			
		case "Bleed":
			return " bled out";
			
		case "Ignite":
			return " has burnt to a crisp";
			
		case "Poison":
			return " succumbed to Injector poison";
			
		case "Radiation":
			return " fell to radiation";
			
		case "Explosion":
			return " was blown to bits";
			
		case "BlackHole":
			return " was turned into spaghetti";
			
		case "Zombie":
			var _word = choose("murdered", "downed", "incapacitated", "crippled", "maimed", "dunked on", "assassinated", "excecuted", "slaughtered", "eradicated", "killed");
			return " was " + _word + " by a ";
			
		case "FriendlyFire":
			var _word = choose("was mistaken for a zombie", "was betrayed", "was deceived", "was sold down the river", "was double-crossed", "used Mimicry at a bad time then got shot");
			return " " + _word + " by ";
	}
	return " has been downed.";
}