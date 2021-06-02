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
	
	headColor = c_white;
	torsoColor = c_white;
	armsColor = c_white;
	legColor = c_white;
	
	startingItem = StartingItem.None;
	
	Save = function()
	{
		
	};
	
	Load = function()
	{
		
	};
}