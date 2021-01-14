/// @description Toggle Door
toggle = !toggle;
canCollidePlayer = toggle;
canCollideZombie = toggle;

if(!toggle)
	image_index = 1;
else
	image_index = 0;
	
with(Turret)
{
	recalculate = true;
}
	
if(!toggle)
	exit;

var hits = ds_list_create();
var count = instance_place_list(x, y, Player, hits, false);
var _move = 1;

if(count > 0)
{
	for(var i=0; i<count; i++)
	{
		if(hits[| i].x < x)
			_move = -1;
		while(AABBCollision(id, hits[| i]))
			hits[| i].x += _move;
	}
}

ds_list_clear(hits);
count = instance_place_list(x, y, ZombieParent, hits, false);
_move = 1;

if(count > 0)
{
	for(var i=0; i<count; i++)
	{
		if(hits[| i].x < x)
			_move = -1;
		while(AABBCollision(id, hits[| i]))
			hits[| i].x += _move;
	}
}

ds_list_destroy(hits);