event_inherited();

paddingX = 64;
paddingY = 192;

UIController.select[0] = id;

UIUp = MenuQuit;
UIDown = MenuSurviveOnline;

UIButtonSetHook(id, OnClickSurviveLocal);