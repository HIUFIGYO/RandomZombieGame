for(var i=0; i<4; i++)
{
	switch(screenSelect[i])
	{
		case SetUpScreen.Enter:
			if(InputGetButtonDown(i, Button.Confirm))
			{
				playerAmount++;
				selection = 0;
				screenSelect[i] = SetUpScreen.Profile;
				if(!loaded and directory_exists("Profiles"))
				{
					var file = file_find_first(working_directory + "Profiles/*.json", fa_readonly);
					if(file != "")
					{
						loaded = true;
						while(file != "")
						{
							ds_list_add(loadProfiles, file);
							file = file_find_next();
						}
						file_find_close();
					}
				}
			}
			break;
			
		case SetUpScreen.Profile:
			if(InputGetButtonDown(i, Button.Confirm))
			{
				switch(selection)
				{
					case 0://create profile
						screenSelect[i] = SetUpScreen.Character;
						break;
					case 1://load profile
						if(loaded)
							screenSelect[i] = SetUpScreen.Load;
						break;
					case 2://cancel
						playerAmount--;
						screenSelect[i] = SetUpScreen.Enter;
						break;
				}
				selection = 0;
			}
			break;
		
		case SetUpScreen.Load:
			
			break;
	}
}