enum MessageFilter
{
	PlayerDown = 1,
	PlayerKill = 2,
	SpecialZombie = 4
}

///@function MessageCheckFilter(messageController, filter)

function MessageCheckFilter(_messageController, _filter)
{
	return _messageController.messageFilter & _filter == _filter;
}

///@function MessageAddAll(message, color, filter)

function MessageAddAll(_message, _color, _filter)
{
	var _player = noone;
	for(var i=0; i<global.playerAmount; i++)
	{
		_player = instance_find(Player, i);
		
		if(MessageControllerFull(_player.messageController))
			continue;
		
		if(MessageCheckFilter(_player.messageController, _filter))
		{
			ds_list_add(_player.messageController.messageList, _message);
			ds_list_add(_player.messageController.messageColor, _color);
		}
	}
}

///@function MessageAddPlayer(player, message, color, filter)

function MessageAddPlayer(_player, _message, _color, _filter)
{
	if(MessageControllerFull(_player.messageController))
		return;
	
	if(MessageCheckFilter(_player.messageController, _filter))
	{
		ds_list_add(_player.messageController.messageList, _message);
		ds_list_add(_player.messageController.messageColor, _color);
	}
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
			
		case "Zombie":
			var _word = choose("murdered", "downed", "incapacitated", "crippled", "maimed", "dunked on", "assassinated", "excecuted", "slaughtered", "eradicated", "killed");
			return " was " + _word + " by a ";
			
		case "FriendlyFire":
			var _word = choose("was mistaken for a zombie", "was betrayed", "was deceived", "was sold down the river", "was double-crossed", "used Mimicry at a bad time then got shot");
			return " " + _word + " by ";
	}
	return " has been downed.";
}