enum GameDifficulty
{
	Easy,
	Medium,
	Hard,
	VeryHard
}

global.maxPlayers = 4;
global.playerAmount = 1;
global.difficulty = GameDifficulty.Easy;
global.selectedGameMode = GM.Skirmish;
global.playerInput[0] = Controller.Keyboard;
global.playerInput[1] = Controller.Gamepad1;
global.playerInput[2] = Controller.Gamepad2;
global.playerInput[3] = Controller.Gamepad3;

global.bloodAmount = 10;