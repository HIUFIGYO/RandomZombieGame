enum GameDifficulty
{
	Easy,
	Medium,
	Hard,
	VeryHard,
	count
}

global.worldUnit = 32; //in pixels

global.startingPlayerAmount = 2;
global.maxPlayers = 4;
global.playerAmount = 1;

global.difficulty = GameDifficulty.Hard;
global.selectedGameMode = GM.Skirmish;

global.playerName[0] = "Player 1";
global.playerName[1] = "Player 2";
global.playerName[2] = "Player 3";
global.playerName[3] = "Player 4";

global.playerInput[0] = Controller.Keyboard;
global.playerInput[1] = Controller.Gamepad1;
global.playerInput[2] = Controller.Gamepad2;
global.playerInput[3] = Controller.Gamepad1;

global.bloodAmount = 1;

global.shopID = noone;