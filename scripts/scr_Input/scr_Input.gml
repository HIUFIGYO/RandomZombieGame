enum Button
{
	Left,
	Right,
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
	Pause,
	count
}

enum Axis
{
	Horizontal = gp_axislh,
	Vertical = gp_axislv,
}

enum Controller
{
	Keyboard,
	Gamepad1,
	Gamepad2,
	Gamepad3,
	Gamepad4
}

function InputGetButton(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check(Input.keyMap[_button]);
	}
	return gamepad_button_check(_id - 1, Input.gamepadMap[_button]);
}

function InputGetButtonDown(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check_pressed(Input.keyMap[_button]);
	}
	return gamepad_button_check_pressed(_id - 1, Input.gamepadMap[_button]);
}

function InputGetButtonUp(_id, _button)
{
	if(_id == 0)
	{
		return keyboard_check_released(Input.keyMap[_button]);
	}
	return gamepad_button_check_released(_id - 1, Input.gamepadMap[_button]);
}

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