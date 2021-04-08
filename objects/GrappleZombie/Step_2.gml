if(grabTarget == noone)
	return;

grabTarget.x = grabX;
grabTarget.ySpeed = max(0, grabTarget.ySpeed);

if(grabTarget.isDead)
{
	event_perform(ev_other, ev_user1);
}