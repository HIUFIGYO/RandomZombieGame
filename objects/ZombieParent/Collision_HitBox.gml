if(isDead or other.pierce <= 0)
	exit;

other.pierce -= 1;
DamageZombie(other.playerID, id, other.damage);