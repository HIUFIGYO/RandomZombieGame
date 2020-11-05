ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

x += xSpeed * DeltaTime();
y += ySpeed * DeltaTime();