/// @description Objectives complete

if(completedObjectives)
	return;
	
completedObjectives = true;

for(var i=0; i<global.playerAmount; i++)
{
	var _player = instance_find(Player, i);
	var sequence = layer_sequence_create(GameManager.layerObject, _player.xstart, _player.ystart, seq_DroneEvac);
	var evacPod = instance_create_layer(_player.xstart, _player.ystart, GameManager.layerObject, EvacPod);
	evacPod.sequenceID = sequence;
	var sequenceInst = layer_sequence_get_instance(sequence);
	sequence_instance_override_object(sequenceInst, EvacPod, evacPod);
	layer_sequence_pause(sequence);
}