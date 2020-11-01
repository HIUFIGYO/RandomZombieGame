if(Window.viewsBuilt)
{
	gameMode = GameSpawnGameMode();
	var count = instance_number(PlayerSpawner);
	var pos, inst_player;
	for(var i=0; i<count; i++)
	{
		if(i >= global.playerAmount)
			break;
		pos = instance_find(PlayerSpawner, i);
		inst_player = instance_create_layer(pos.x, pos.y, layerPlayer, Player);
		GameSetUpPlayer(inst_player, i);
	}
}
else
	alarm[0] = 1;