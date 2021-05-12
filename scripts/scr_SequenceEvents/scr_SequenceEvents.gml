///@function SequenceEventEvacPodLand()

function SequenceEventEvacPodLand()
{
	var sequence = elementID;
	
	layer_sequence_pause(sequence);
	
	with(EvacPod)
	{
		if(sequence != sequenceID)
			continue;
			
		waitTime = waitTimeMax;
		open = true;
		image_speed = 0.5;
	}
}
