/// @description Player went down

var gameEnd = true;

with(Player)
{
	if(!isDead)
		gameEnd = false;
}

if(gameEnd)
{
	gameOverTimer = gameOverTime;
	with(GameManager)
		event_perform(ev_other, ev_user0);
}