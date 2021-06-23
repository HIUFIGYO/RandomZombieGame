enum SetUpScreen
{
	Enter,
	Profile,
	Load,
	Character,
	Color
}

///@function PlayerSetUpKeyboardControl()

function PlayerSetUpKeyboardControl()
{
	if(!isNaming)
		return;
		
	if(keyboard_check_pressed(vk_enter))
	{
		isNaming = false;
		profile[nameIndex].name = nameString;
		return;
	}
	
	if(keyboard_check_pressed(vk_backspace))
	{
		nameString = string_copy(nameString, 0, string_length(nameString) - 1);
		return;
	}
	
	if(string_length(nameString) >= maxCharacters)
		return;
		
	if(keyboard_check_pressed(vk_space))
	{
		nameString += " ";
		return;
	}
	
	if(!keyboard_check_pressed(vk_anykey))
		return;
		
	var _key = keyboard_lastkey;
	
	if(_key >= ord("A") and _key <= ord("Z"))
	{
		var offset = 0;
		if(keyboard_check(vk_shift))
			offset = 32;
			
		nameString += chr(_key + offset);
	}
	
	if(_key >= ord("0") and _key <= ord("9"))
	{
		nameString += chr(_key);
	}
}

///@function PlayerSetUpHighlight(index)

function PlayerSetUpHighlight(_index)
{
	for(var i=0; i<ds_list_size(groupUI[_index]); i++)
	{
		var _color = c_white;
		if(i == selection[_index])
			_color = c_yellow;
		UISetColor(groupUI[_index][| i], _color);
	}
}

///@function PlayerSetUpUpdateEnter(index, input)

function PlayerSetUpUpdateEnter(i, _input)
{	
	if(!startGame and InputGetButtonDown(global.playerInput[i], Button.Confirm))
	{
		ready[i] = false;
		playerAmount++;
		selection[i] = 0;
		PlayerSetUpCreateProfile(i);
		if(!loaded)
		{
			if(!directory_exists("Profiles"))
			{
				directory_create("Profiles");
				return;
			}
			
			var file = file_find_first("Profiles/*.json", 0);
			if(file != "")
			{
				loaded = true;
				while(file != "")
				{
					ds_list_add(loadProfiles, string_copy(file, 0, string_length(file) - 5));
					file = file_find_next();
				}
				file_find_close();
			}
		}
	}
}

///@function PlayerSetUpUpdateProfile(index, input)

function PlayerSetUpUpdateProfile(i, _input)
{
	selection[i] = ClampScroll(selection[i] + _input.y, 0, 2);
	
	PlayerSetUpHighlight(i);
	
	if(InputGetButtonDown(global.playerInput[i], Button.Confirm))
	{
		switch(selection[i])
		{
			case 0://create profile
				PlayerSetUpCreateCharacter(i);
				break;
			case 1://load profile
				if(loaded)
					PlayerSetUpCreateLoad(i);
				break;
			case 2://cancel
				ready[i] = true;
				playerIndex[i] = noone;
				playerAmount--;
				PlayerSetUpCreateEnter(i);
				break;
		}
		selection[i] = 0;
	}
	else if(InputGetButtonDown(global.playerInput[i], Button.Cancel))
	{
		ready[i] = true;
		playerIndex[i] = noone;
		playerAmount--;
		PlayerSetUpCreateEnter(i);
	}
}

///@function PlayerSetUpUpdateLoad(index, input)

function PlayerSetUpUpdateLoad(i, _input)
{
	selection[i] = ClampScroll(selection[i] + _input.y, 0, ds_list_size(loadProfiles) - 1);
	
	PlayerSetUpHighlight(i);
	
	if(InputGetButtonDown(global.playerInput[i], Button.Confirm))
	{
		var fileName = "Profiles/" + loadProfiles[| selection[i]] + ".json";
		if(file_exists(fileName))
		{
			profile[i].Load(loadProfiles[| selection[i]]);
			PlayerSetUpCreateCharacter(i);
		}
		selection[i] = 0;
	}
	else if(InputGetButtonDown(global.playerInput[i], Button.Cancel))
	{
		PlayerSetUpCreateProfile(i);
	}
}

///@function PlayerSetUpUpdateCharacter(index, input)

function PlayerSetUpUpdateCharacter(i, _input)
{
	selection[i] = ClampScroll(selection[i] + _input.y, 0, 7);
	
	PlayerSetUpHighlight(i);
	
	if(InputGetButtonDown(global.playerInput[i], Button.Confirm))
	{
		if(selection[i] == 0)//name
		{
			if(!isNaming)
			{
				isNaming = true;
				nameString = profile[i].name;
				nameIndex = i;
			}
		}
		else if(selection[i] == 5)//colors
		{
			screenSelect[i] = PlayerSetUpUpdateColor;
		}
		else if(selection[i] == 6)//save
		{
			profile[i].Save();
		}
		else if(selection[i] == 7)//ready
		{
			ready[i] = true;
			
			PlayerSetUpCreateReady(i);
			
			var allReady = true;
			
			for(var check=0; check<4; check++)
			{
				if(!ready[check])
					allReady = false;
			}
			
			if(allReady)
			{
				startGame = true;
				global.playerAmount = playerAmount;
				UISetVisible(countDownUI, true);
			}
		}
		selection[i] = 0;
	}
	else if(InputGetButtonDown(global.playerInput[i], Button.Cancel))
	{
		PlayerSetUpCreateProfile(i);
		selection[i] = 0;
	}
}

///@function PlayerSetUpUpdateColor(index, input)

function PlayerSetUpUpdateColor(i, _input)
{
	//pick a color you idiot.
}

///@function PlayerSetUpUpdateReady(index, input)

function PlayerSetUpUpdateReady(i, _input)
{
	if(!startGame and InputGetButtonDown(global.playerInput[i], Button.Cancel))
	{
		ready[i] = false;
		PlayerSetUpCreateCharacter(i);
	}
}






