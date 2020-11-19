//health regen
if(!isDead)
	hpRegenTimer -= DeltaTimeSecond();
if(hpRegenTimer <= 0)
{
	hp += hpRegenRate;
	hp = clamp(hp, 0, maxHp);
	hpRegenTimer = hpRegenTime + global.difficulty;
}

//stamina regen
staminaWaitTimer -= DeltaTimeSecond();
if(staminaWaitTimer <= 0)
{
	stamina += staminaRegenRate * DeltaTimeSecond();
	stamina = clamp(stamina, 0, maxStamina);
}