///@function OnClickSurviveLocal()

function OnClickSurviveLocal()
{
	MenuControllerSelect(MenuGroup.Local, false);
	MenuControllerScroll(MenuGroup.Local, 0);
}

///@function OnClickQuit()

function OnClickQuit()
{
	MenuControllerSelect(MenuGroup.Quit, false);
	MenuControllerScroll(MenuGroup.Quit, 1);
}