/// @description create UI

var str = "3";

countDownUI = UICreateText(0, 0, str, UIDrawTo.ViewPort);
UISetVisible(countDownUI, false);
UISetColor(countDownUI, c_red);
UISetAlign(countDownUI, RectAlign.Center, RectAlign.Center);
UITextSetFont(countDownUI, Font_large);
UISetSize(countDownUI, string_width(str), string_height(str));