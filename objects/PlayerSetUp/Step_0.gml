if(startGame)
{
	//count down.
	return;
}

for(var i=0; i<4; i++)
{	
	var _input = new Vector2(
		InputGetButtonDown(i, Button.Right) - InputGetButtonDown(i, Button.Left),
		InputGetButtonDown(i, Button.Down) - InputGetButtonDown(i, Button.Up));
	
	screenSelect[i](i, _input);
}