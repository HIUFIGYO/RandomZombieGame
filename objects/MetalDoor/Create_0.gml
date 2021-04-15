event_inherited();

hp = 400;
maxHp = hp;
toggle = true;
canCollidePlayer = true;
canCollideZombie = true;
canCollideBullet = true;

recalculateLaser = true;
hpRegenRate = 1; // health per second
respawnTimer = 0;
respawnTime = 60;

image_speed = 0;
alarm[0] = 1;

event_perform(ev_other, ev_user0);