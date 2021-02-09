enum Button
{
	Left,
	Right,
	Up,
	Down,
	Jump,
	Crouch,
	Interact,
	Shoot,
	Grenade,
	ToggleWeapon,
	Melee,
	NextGear,
	PreviousGear,
	Reload,
	Sprint,
	Assist,
	DropMoney,
	DropWeap,
	Pause,
	count
}

enum Axis
{
	Horizontal = gp_axislh,
	Vertical = gp_axislv,
	Left = 1000,
	Right = 1001,
	Up = 1002,
	Down = 1003
}

enum Controller
{
	Keyboard,
	Gamepad1,
	Gamepad2,
	Gamepad3,
	Gamepad4
}

///@function InputGetButton(id, button)

function InputGetButton(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check(Input.keyMap[_button]);
	}
	var isPressed = false;
	switch(Input.gamepadMap[_button])
	{
		case Axis.Left:
			if(gamepad_axis_value(_id - 1, gp_axislh) < 0)
				isPressed = true;
			break;
		case Axis.Right:
			if(gamepad_axis_value(_id - 1, gp_axislh) > 0)
				isPressed = true;
			break;
		case Axis.Up:
			if(gamepad_axis_value(_id - 1, gp_axislv) < 0)
				isPressed = true;
			break;
		case Axis.Down:
			if(gamepad_axis_value(_id - 1, gp_axislv) > 0)
				isPressed = true;
			break;
		default:
			isPressed = gamepad_button_check(_id - 1, Input.gamepadMap[_button]);
			break;
	}
		
	return isPressed;
}

///@function InputGetButtonDown(id, button)

function InputGetButtonDown(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check_pressed(Input.keyMap[_button]);
	}
	return gamepad_button_check_pressed(_id - 1, Input.gamepadMap[_button]);
}

///@function InputGetButtonUp(id, button)

function InputGetButtonUp(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check_released(Input.keyMap[_button]);
	}
	return gamepad_button_check_released(_id - 1, Input.gamepadMap[_button]);
}

///@function InputGetAxis(id, axis)

function InputGetAxis(_id, _axis)
{
	if(_id == 0)
	{
		var a, b;
		a = Button.Crouch;
		b = Button.Jump;
		if(_axis == Axis.Horizontal)
		{
			a = Button.Right;
			b = Button.Left;
		}
		return keyboard_check(Input.keyMap[a]) - keyboard_check(Input.keyMap[b])
	}
	return gamepad_axis_value(_id - 1, _axis)
}

///@function InputPlayerGetButtonDown(id, button)

function InputPlayerGetButtonDown(_id, _button)
{
	if(isDead or !canMove)
		return false;
	return InputGetButtonDown(_id, _button);
}

///@function InputPlayerGetButtonUp(id, button)

function InputPlayerGetButtonUp(_id, _button)
{
	if(isDead or !canMove)
		return false;
	return InputGetButtonUp(_id, _button);
}

///@function InputPlayerGetButton(id, button)

function InputPlayerGetButton(_id, _button)
{
	if(isDead or !canMove)
		return false;
	return InputGetButton(_id, _button);
}