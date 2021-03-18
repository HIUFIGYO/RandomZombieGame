enum PartType
{
	BlackHole
}

///@function PartTypeInit()

function PartTypeInit()
{
	particleTypes = ds_list_create();
	
	PartDefineBlackHole();
}

///@function PartSystemInit()

function PartSystemInit()
{
	particleSystemCount = 2;
	particleSystem[0] = part_system_create_layer(GameManager.layerObject, false);
	particleSystem[1] = part_system_create_layer(GameManager.layerCorpse, false);
}

///@function PartCleanUp()

function PartCleanUp()
{
	for(var i=0; i<particleSystemCount; i++)
	{
		if(part_system_exists(particleSystem[i]))
			part_system_destroy(particleSystem[i]);
	}
	particleSystemCount = 0;
}

///@function PartLazyInit(layer)

function PartLazyInit(_ps)
{
	if(!part_system_exists(ParticleSystem.particleSystem[_ps]))
	{
		with(ParticleSystem)
			PartSystemInit();
	}
}

///@function PartCreateEmitter(layer, shape, distribution)

function PartCreateEmitter(_ps, _shape, _distribution)
{
	PartLazyInit(_ps);
	var _emitter = part_emitter_create(ParticleSystem.particleSystem[_ps]);
	part_emitter_region(ParticleSystem.particleSystem[_ps], _emitter, x, x, y, y, _shape, _distribution);
	return _emitter;
}

///@function PartDestroyEmitter(layer, emitter)

function PartDestroyEmitter(_ps, emitter)
{
	PartLazyInit(_ps);
	
	if(part_emitter_exists(ParticleSystem.particleSystem[_ps], emitter))
		part_emitter_destroy(ParticleSystem.particleSystem[_ps], emitter);
}

///@function PartEmitStream(layer, emitter, partType)

function PartEmitStream(_ps, emitter, partType)
{
	PartLazyInit(_ps);
	part_emitter_stream(ParticleSystem.particleSystem[_ps], emitter, partType, 1);
}

///@function PartDefineBlackHole()

function PartDefineBlackHole()
{
	var partType = part_type_create();
	
	//body
	part_type_shape(partType, pt_shape_sphere);
	
	part_type_size(partType, 1.8, 2, 0, 0.5);
	
	part_type_speed(partType, 0.5, 1, 0.2, 0.1);
	part_type_direction(partType, 0, 360, 22, 0);
	part_type_orientation(partType, 0, 360, 0, 0, 0);
	
	part_type_color3(partType, c_black, c_grey, c_purple);
	part_type_alpha3(partType, 1, 0.8, 0);
	
	part_type_life(partType, 20, 30);
	
	ds_list_add(particleTypes, partType);
	
	//particles
	partType = part_type_create();
	
	part_type_shape(partType, pt_shape_pixel);
	
	part_type_size(partType, 10, 20, 0, 0);
	
	part_type_speed(partType, 0.5, 1, 0.2, 0.1);
	part_type_direction(partType, 0, 360, 0, 0);
	
	part_type_color3(partType, c_white, c_white, c_grey);
	part_type_alpha3(partType, 1, 0.8, 0);
	
	part_type_life(partType, 20, 30);
	
	ds_list_add(particleTypes, partType);
}