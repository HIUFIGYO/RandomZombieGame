/// @description Zombie Died

if(completedObjectives)
	return;

objectiveKills = clamp(++objectiveKills, 0, objectiveTargetKills);

if(objectiveKills >= objectiveTargetKills and objectiveTimeMin <= 0 and objectiveTimeSec <= 0)
	event_perform(ev_other, ev_user2);