if(gameOver)
	exit;

timeSeconds += DeltaTimeSecond();
if(timeSeconds >= 60)
{
	timeSeconds -= 60;
	timeMinutes += 1;
	if(timeMinutes >= 60)
	{
		timeMinutes = 0;
		timeHours += 1;
	}
}
timeString = "";

if(timeHours < 10)
	timeString = "0" + string(timeHours) + " : ";
else
	timeString = string(timeHours) + " : ";
	
if(timeMinutes < 10)
	timeString += "0" + string(timeMinutes) + " : ";
else
	timeString += string(timeMinutes) + " : ";
	
if(timeSeconds < 10)
	timeString += "0" + string(floor(timeSeconds));
else
	timeString += string(floor(timeSeconds));
	
UITextSet(timeUI, timeString);