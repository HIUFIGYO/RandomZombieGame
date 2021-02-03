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

///@function MessageAddAll(message, filter)

function MessageAddAll(_message, _filter)
{
	var _player = noone;
	for(var i=0; i<global.playerAmount; i++)
	{
		_player = instance_find(Player, i);
		
		if(MessageControllerFull(_player.messageController))
			continue;
		
		if(MessageCheckFilter(_player.messageController, _filter))
			ds_list_add(_player.messageController.messageList, _message);
	}
}

///@function MessageAddPlayer(player, message, filter)

function MessageAddPlayer(_player, _message, _filter)
{
	if(MessageControllerFull(_player.messageController))
		return;
	
	if(MessageCheckFilter(_player.messageController, _filter))
		ds_list_add(_player.messageController.messageList, _message);
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