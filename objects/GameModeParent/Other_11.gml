/// @description Player went down

var gameEnd = true;

with(Player)
{
	if(fadeOut < 1)
		continue;
	
	if(!isDead)
		gameEnd = false;
}

if(gameEnd)
{
	with(GameManager)
		event_perform(ev_other, ev_user0);
}