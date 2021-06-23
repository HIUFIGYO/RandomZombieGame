enum SetUpScreen
{
	Enter,
	Profile,
	Load,
	Character,
	Color
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
			//edit name
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






