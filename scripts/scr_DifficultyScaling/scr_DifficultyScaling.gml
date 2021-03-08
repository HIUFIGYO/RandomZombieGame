///@function SetStat(easy, med, hard, veryHard)

function SetStat(_easy, _med, _hard, _veryHard)
{
	var _stat = 2;
	switch(global.difficulty)
	{
		case GameDifficulty.Easy:
			_stat = _easy;
			break;
		case GameDifficulty.Medium:
			_stat = _med;
			break;
		case GameDifficulty.Hard:
			_stat = _hard;
			break;
		case GameDifficulty.VeryHard:
			_stat = _veryHard;
			break;
	}
	
	return _stat;
}

///@function SetZombieSpeed(speed)

function SetZombieSpeed(_speed)
{
	var _value = _speed;
	if(global.difficulty = GameDifficulty.Hard)
		_value += 0.5;
	if(global.difficulty = GameDifficulty.VeryHard)
		_value += 1;
	return _value;
}