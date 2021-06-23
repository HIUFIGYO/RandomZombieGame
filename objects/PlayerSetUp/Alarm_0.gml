/// @description create UI

countDownUI = UICreateText(0, 0, "3", UIDrawTo.ViewPort);
UISetVisible(countDownUI, false);
UISetColor(countDownUI, c_red);
UISetAlign(countDownUI, RectAlign.Center, RectAlign.Center);
UITextSetFont(countDownUI, Font_large);