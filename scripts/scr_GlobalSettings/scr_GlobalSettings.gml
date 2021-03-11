enum GameDifficulty
{
	Easy,
	Medium,
	Hard,
	VeryHard,
	count
}

global.worldUnit = 32; //in pixels

global.maxPlayers = 4;
global.playerAmount = 1;
global.difficulty = GameDifficulty.Hard;
global.selectedGameMode = GM.Skirmish;

global.playerName[0] = "Player1";
global.playerName[1] = "Player2";
global.playerName[2] = "Player3";
global.playerName[3] = "Player4";

global.playerInput[0] = Controller.Keyboard;
global.playerInput[1] = Controller.Gamepad1;
global.playerInput[2] = Controller.Keyboard;
global.playerInput[3] = Controller.Gamepad3;

global.bloodAmount = 1;

global.shopID = noone;