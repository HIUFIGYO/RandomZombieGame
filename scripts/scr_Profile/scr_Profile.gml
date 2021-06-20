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
	Random,
	count
}

///@function Profile()

function Profile() constructor
{
	name = "Player";
	
	accessory = 0;
	head = 0;
	torso = 0;
	startingItem = StartingItem.None;
	
	headColor = c_white;
	torsoColor = c_white;
	armsColor = c_white;
	legColor = c_white;
	
	Randomize = function()
	{
		accessory = irandom(5);
		head = irandom(4);
		torso = irandom(3);
		startingItem = irandom(StartingItem.count);
		
		headColor = irandom(c_white);
		torsoColor = irandom(c_white);
		armsColor = irandom(c_white);
		legColor = irandom(c_white);
	};
	
	Save = function()
	{
		if(!directory_exists("Profiles"))
		{
			directory_create("Profiles");
		}
		
		var file = file_text_open_write("Profiles/" + string(name) + ".json");
		file_text_write_string(file, json_stringify(self));
		file_text_close(file);
	};
	
	Load = function(_name)
	{
		var file = file_text_open_read("Profiles/" + _name + ".json");
		var data = json_parse(file_text_read_string(file));
		name = data.name;
		accessory = data.accessory;
		head = data.head;
		torso = data.torso;
		startingItem = data.startingItem;
		headColor = data.headColor;
		torsoColor = data.torsoColor;
		armsColor = data.armsColor;
		legColor = data.legColor;
		file_text_close(file);
	};
}