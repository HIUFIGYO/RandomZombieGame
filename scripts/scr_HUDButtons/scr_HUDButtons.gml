///@function OnClickSurviveLocal()

function OnClickSurviveLocal()
{
	with(MainMenuController)
	{
		MenuControllerEnableButtons(false);
		MenuControllerCreateLocal();
	}
}

///@function OnClickQuit()

function OnClickQuit()
{
	with(MainMenuController)
	{
		MenuControllerEnableButtons(false);
		MenuControllerCreateQuit();
	}
}