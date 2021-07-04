if(!gameOver)
	return;

var i, playerIndex, xx, yy;
var displayWidth = display_get_gui_width(),
	displayHeight = display_get_gui_height();

draw_set_font(Font_large);
draw_set_alpha(1);

draw_set_color(c_black);
draw_rectangle(0, 0, displayWidth, displayHeight, false);

//draw result title
draw_sprite_ext(spr_matchendMessage, resultIndex, displayWidth / 2, 64, 1, 1, 0, resultIndex == 0 ? c_green : c_red, 1);

//difficulty
xx = displayWidth / 2;
draw_set_halign(fa_center);
draw_set_color(DataBase.difficultyColor[global.difficulty]);
draw_text(xx, 128, DataBase.difficultyText[global.difficulty]);

//total kills
yy = displayHeight - footerHeight;
draw_set_color(c_white);
draw_text(xx, yy, "Total Kills: " + string(totalKills));
draw_text(xx, yy + 60, "Time Survived: " + timeSurvived);

draw_set_halign(fa_left);
draw_set_font(Font_default);

//draw horizontal lines
for(var i=0; i<EndStat.count; i++)
{
	xx = sidePadding;
	yy = headerHeight + i*32;
	draw_set_color(c_white);
	draw_text(xx, yy, endStatText[i]);
	draw_line_width_color(xx, yy+28, displayWidth - sidePadding, yy+28, 4, c_white, c_gray);
	
	//draw stats
	draw_set_halign(fa_center);
	for(playerIndex=0; playerIndex<playerAmount; playerIndex++)
	{
		xx = ((displayWidth - sidePadding - (playerAmount * cellWidth)) + (cellWidth / 2)) + (playerIndex * cellWidth);
		draw_set_color(dataHighest[# playerIndex, i] ? c_yellow : c_white);
		draw_text(xx, yy, string(data[# playerIndex, i]));
	}
	draw_set_halign(fa_left);
}

//draw vertical
draw_set_halign(fa_center);
for(i=0; i<playerAmount; i++)
{
	xx = ((displayWidth - sidePadding - (playerAmount * cellWidth))) + (i * cellWidth);
	yy = headerHeight - 64;
	draw_set_color(c_white);
	draw_text(xx + cellWidth / 2, yy, instance_find(Player, i).name);
	draw_line_width_color(xx - 8, yy, xx - 8, yy + EndStat.count*32 + 60, 4, c_white, c_gray);
}
draw_set_halign(fa_left);