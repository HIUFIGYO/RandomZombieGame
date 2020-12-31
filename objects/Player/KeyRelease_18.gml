/// @description Insert description here
// You can write your code in this editor
var index = irandom(DeBuff.count);
while(index == DeBuff.Poison)
	index = irandom(DeBuff.count);
deBuff[index] = true;
deBuffTimer[index] = 4;
deBuffStack[index] = 1;