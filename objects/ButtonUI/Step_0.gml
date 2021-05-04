var hover = UIMouseHover(id);
if(UIGetSelected(id) or hover)
	subImage = 1;
else
	subImage = 0;
	
if(mouse_check_button_pressed(mb_left))
	hook();