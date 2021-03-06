if(Window.viewsBuilt)
{
	instance_create_layer(0, 0, layerBloodGrinder, BloodGrinder);
	//game mode object
	gameMode = GameSpawnGameMode();
	instance_create_layer(0, 0, UIController.layerUI2, EndGameResultsUI);
	
	//players
	var pos, inst_player;
	for(var i=0; i<instance_number(PlayerSpawner); i++)
	{
		if(i >= global.playerAmount)
			break;
		pos = instance_find(PlayerSpawner, i);
		inst_player = instance_create_layer(pos.x, pos.y, layerPlayer, Player);
		GameSetUpPlayer(inst_player, i);
	}
	ready = true;
}
else
	alarm[0] = 1;