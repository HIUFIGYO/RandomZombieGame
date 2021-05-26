event_inherited();

parent = MenuSettings;
paddingY = 64;

UIUp = MenuSettings;
UIDown = MenuSurviveLocal;

UIButtonSetHook(id, OnClickQuit);

UIDirty(id);