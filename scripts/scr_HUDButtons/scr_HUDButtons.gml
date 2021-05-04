///@function OnClickSurviveLocal()

function OnClickSurviveLocal()
{
	global.playerAmount = global.startingPlayerAmount;
	AudioChangeMode(AudioModeGame);
	RoomGoto(rm_stage01);
}