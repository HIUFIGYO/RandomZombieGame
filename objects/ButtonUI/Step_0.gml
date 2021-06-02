var hover = UIMouseHover(id);
isSelected = false;
if((UIGetSelected(id) or hover) and enabled)
{
	subImage = 1;
	isSelected = true;
}
else
{
	subImage = 0;
}
	
color = enabled ? c_white : c_grey;

if(hover and enabled and mouse_check_button_pressed(mb_left))
	hook();