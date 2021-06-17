enum StartingItem
{
	None,
	Rifle,
	Shotgun,
	MaxGrenade,
	Medicine,
	Adrenaline,
	Strength,
	Barricade,
	Armour,
	Money,
	Random
}

///@function Profile()

function Profile() constructor
{
	name = "<No Name>";
	
	accessory = 0;
	head = 0;
	torso = 0;
	startingItem = StartingItem.None;
	
	headColor = c_white;
	torsoColor = c_white;
	armsColor = c_white;
	legColor = c_white;
	
	Save = function()
	{
		var file = file_text_open_write(working_directory + "Profiles/" + string(name) + ".json");
		file_text_write_string(file, json_stringify(self));
		file_text_close(file);
	};
	
	Load = function(_name)
	{
		var file = file_text_open_read(working_directory + "Profiles/" + _name + ".json");
		//load shit here.
		file_text_close(file);
	};
}