position = new Vector2(0, 0);
size = new Vector2(32, 32);

pixelPosition = new Vector2(position.x, position.y);
pixelSize = new Vector2(size.x, size.y);

context = new Vector2(0, 0);

color = c_white;
alpha = 1;
parent = noone;
alignH = RectAlign.Left;
alignV = RectAlign.Top;
drawTo = UIDrawTo.GUI;
drawView = 0;
children = ds_list_create();
sortDepth = 0;
isActive = true;

isSelected = false;

alignFlag = true;
UIController.sortFlag = true;