image_speed = 0;

if(open)
	image_index = image_number - 1;
else
{
	image_index = 0;
	layer_sequence_play(sequenceID);
	
	var winCondition = true;
	
	with(Player)
	{		
		if(!isDead and fadeOut >= 1)
			winCondition = false;
	}
	
	if(winCondition and !GameManager.gameOver)
	{
		EndGameSetResult(0);
		with(GameManager)
			event_perform(ev_other, ev_user0);
		MessageAddAll("Extraction successful", MessageFilter.Notification);
	}
}