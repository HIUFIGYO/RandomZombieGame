draw_self();

draw_sprite(spr_shopOpenClosed, shopMaskIndex, x, y);

if(isOpen)
	return;
	
draw_set_color(c_red);
draw_circle(xstart, ystart + 48, extractRadius, true);

if(objectiveKills == objectiveTargetKills)
	draw_set_color(c_lime);

var str = "Kills: " + string(objectiveKills) + " / " + string(objectiveTargetKills);

draw_text(xstart - string_width(str) / 2, ystart - 128, str);

draw_set_color(c_red);

str = "0" + string(objectiveTimeMin) + " : ";

var _second = ceil(objectiveTimeSec);

if(_second < 10)
	str += "0";

str += string(_second);

if(objectiveTimeSec <= 0 and objectiveTimeMin <= 0)
	draw_set_color(c_lime);

draw_text(xstart - string_width(str) / 2, ystart - 148, str);