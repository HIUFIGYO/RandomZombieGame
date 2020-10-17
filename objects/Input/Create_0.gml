/// @description Set Up

var i;

playerCount = 4;

gameController = ds_map_create();

buttonCheck = [];
buttonDownCheck = [];
buttonUpCheck = [];

axisDeadZone = 0.25;
buttonThreshold = 0.1;

for(i=0; i<playerCount; i++)
{
	buttonCheck[i] = ds_map_create();
	buttonDownCheck[i] = ds_map_create();
	buttonUpCheck[i] = ds_map_create();
}