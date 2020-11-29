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
}