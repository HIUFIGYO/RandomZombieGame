var _input = new Vector2(
				InputGetButtonDown(0, Button.Right) - InputGetButtonDown(0, Button.Left),
				InputGetButtonDown(0, Button.Down) - InputGetButtonDown(0, Button.Up));
	
screenSelect(_input);