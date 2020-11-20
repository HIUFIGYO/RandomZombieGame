var updateText = false;

//toggle/spawn zombies
var currentSelection = zombieSelect;

var input = keyboard_check_pressed(vk_numpad6) - keyboard_check_pressed(vk_numpad4);
zombieSelect += input;

if(zombieSelect < 0)
	zombieSelect = zombieMaxSelect;
if(zombieSelect > zombieMaxSelect)
	zombieSelect = 0;
	
if(currentSelection != zombieSelect)
{
	UIImageSetSprite(zombieImage, zombieSprite[zombieSelect], 0, false);
}
	
if(keyboard_check_pressed(vk_numpad5))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, zombie[zombieSelect]);
	GameSpawnZombie();
}

//toggle weapons
currentSelection = weaponSelect;
input = keyboard_check_pressed(vk_numpad3) - keyboard_check_pressed(vk_numpad1);
weaponSelect += input;

if(weaponSelect > Weapon.count - 1)
	weaponSelect = 0;
if(weaponSelect < 0)
	weaponSelect = Weapon.count - 1;
	
if(currentSelection != weaponSelect)
{
	UIImageSetSprite(weaponImage, spr_weapons, weaponSelect, false);
}

if(keyboard_check_pressed(vk_numpad2))
{
	var player = instance_find(Player, 0);
	var inst = instance_create_layer(player.x, player.y - 72, GameManager.layerObject, WeaponDrops);
	inst.weapon_id = weaponSelect;
	inst.ammo = DataWeapon(weaponSelect, WeapStat.Ammo);
	inst.mag = DataWeapon(weaponSelect, WeapStat.Mag);
	inst.image_index = weaponSelect;
}

//toggle demi god mode
if(keyboard_check_pressed(vk_numpad7))
	godMode = !godMode;
	
if(godMode)
{
	with(Player)
	{
		RevivePlayer(id, maxHp);
	}
}

//cycle difficulty levels
currentSelection = global.difficulty;

if (keyboard_check_pressed(vk_numpad9))
    global.difficulty += 1;
if global.difficulty > GameDifficulty.VeryHard
    global.difficulty =GameDifficulty.Easy;
	
	if(currentSelection != global.difficulty)
{
    UIImageSetSprite(difficultyImage, spr_difficultyIcons, global.difficulty, false);
}

if(global.difficulty > difficultyImage - 1)
    global.difficulty = 0;

//show/hide controls
if(keyboard_check_pressed(vk_numpad8))
{
	updateText = true;
	showControls = !showControls;
}

//clean up room
if(keyboard_check_pressed(vk_delete))
{
	with(ZombieParent)
		instance_destroy();
	with(WeaponDrops)
		instance_destroy();
	ds_queue_clear(GameManager.bodyList);
}

//control text
if(updateText)
{
	UITextSet(controlText, textMessage[showControls]);
}