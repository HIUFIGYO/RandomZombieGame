global.worldUnit = 32; //in pixels

function DeltaTime()
{
	return (delta_time / 1000000) * global.worldUnit;
}

function DeltaTimeSecond()
{
	return (delta_time / 1000000);
}