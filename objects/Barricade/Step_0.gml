event_inherited();

if(hp <= maxHp * 0.66)
	image_index = 1;

if(hp <= maxHp * 0.34)
	image_index = 2;

if(hp <= 0)
{
	image_index = 3;
	instance_destroy();
}