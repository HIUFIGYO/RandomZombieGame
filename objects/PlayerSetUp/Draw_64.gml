//draw cross

var W = Window.width,
	H = Window.height,
	lineW = (W / UIController.targetWidth) * 4;

draw_line_width_color(W/2, 0, W/2, H, lineW, c_orange, c_yellow);
draw_line_width_color(0, H/2, W, H/2, lineW, c_orange, c_yellow);

if(startGame)
{
	draw_set_font(Font_large);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	draw_text(W/2, H/2, "3");	
}

var _str = "";

switch(screenSelect[0])
{
	case PlayerSetUpUpdateEnter:
		_str = "Enter!";
		break;
		
	case PlayerSetUpUpdateProfile:
		_str = "Profile!!";
		break;
	
	case PlayerSetUpUpdateLoad:
		_str = "Load";
		break;
		
	case PlayerSetUpUpdateCharacter:
		_str = "Character";
		break;
		
	case PlayerSetUpUpdateColor:
		_str = "Color";
		break;
}

draw_set_color(c_white);
draw_text(16, 16, _str);