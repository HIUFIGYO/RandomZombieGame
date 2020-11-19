///@function SetZombieStat(easy, med, hard, veryHard)

function SetZombieStat(_easy, _med, _hard, _veryHard)
{
	var _damage = 2;
	switch(global.difficulty)
	{
		case GameDifficulty.Easy:
			_damage = _easy;
			break;
		case GameDifficulty.Medium:
			_damage = _med;
			break;
		case GameDifficulty.Hard:
			_damage = _hard;
			break;
		case GameDifficulty.VeryHard:
			_damage = _veryHard;
			break;
	}
	
	return _damage;
}

///@function SetZombieSpeed(speed)

function SetZombieSpeed(_speed)
{
	var _value = _speed;
	if(global.difficulty > GameDifficulty.Medium)
		_value += 1;
	return _value;
}