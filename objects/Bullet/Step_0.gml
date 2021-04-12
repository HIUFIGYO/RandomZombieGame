//range
rangeTimer--;
if(rangeTimer <= 0)
{
	if(weapon == Weapon.Flame or weapon == Weapon.Tesla)
		instance_destroy();
	gravity = 1;
}

//move
x += xSpeed * spd * DeltaTime();
y += ySpeed * spd * DeltaTime();

CollisionLineList(xPrevious, yPrevious, x, y, BlockParent, BulletCollideBlockParent);
CollisionLineList(xPrevious, yPrevious, x, y, Barricade, BulletCollideBarricade);
CollisionLineListTargets(xPrevious, yPrevious, x, y, Player, targetsHit, BulletCollidePlayer);
CollisionLineListTargets(xPrevious, yPrevious, x, y, ZombieParent, targetsHit, BulletCollideZombie);