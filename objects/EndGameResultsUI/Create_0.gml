gameOver = false;

resultIndex = 0;
gameMode = GM.Skirmish;
totalKills = 0;
timeSurvived = "";

headerHeight = 320;
footerHeight = 320;
cellWidth = 128;
sidePadding = 320;

data = ds_grid_create(global.playerAmount, EndStat.count);
dataHighest = noone;

endStatText[0] = "Kills";
endStatText[1] = "Primary Kills";
endStatText[2] = "Secondary Kills";
endStatText[3] = "Melee Kills";
endStatText[4] = "Kill Assists";
endStatText[5] = "Damage Dealt";
endStatText[6] = "Support Damage";
endStatText[7] = "Damage To Major Threats";
endStatText[8] = "Most Damage Taken";
endStatText[9] = "Health Healed";
endStatText[10] = "Money Earned";
endStatText[11] = "Money Spent";
