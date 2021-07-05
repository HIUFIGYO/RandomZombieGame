#region //Particle System Set Up

	///@function PartTypeInit()

	function PartTypeInit()
	{
		particleTypes = ds_map_create();
	
		PartDefineBlackHole();
		PartDefineExplosion();
	}

	///@function PartSystemInit()

	function PartSystemInit()
	{
		particleSystem = part_system_create_layer(GameManager.layerObject, false);
	}

	///@function PartCleanUp()

	function PartCleanUp()
	{
		if(part_system_exists(particleSystem))
			part_system_destroy(particleSystem);
	}

	///@function PartLazyInit()

	function PartLazyInit()
	{
		if(!part_system_exists(ParticleSystem.particleSystem))
		{
			with(ParticleSystem)
				PartSystemInit();
		}
	}

#endregion

#region //Particle Emitters

	///@funtion PartEmitter(x, y, shape, distribution)
	
	function PartEmitter(x, y, _shape, _distribution) constructor
	{
		emitter = part_emitter_create(ParticleSystem.particleSystem);
		xMin = x;
		xMax = x;
		yMin = y;
		yMax = y;
		shape = _shape;
		distribution = _distribution;
		part_emitter_region(ParticleSystem.particleSystem, emitter, xMin, xMax, yMin, yMax, shape, distribution);
		
		SetRegion = function(_xMin, _xMax, _yMin, _yMax)
		{
			xMin = _xMin;
			xMax = _xMax;
			yMin = _yMin;
			yMax = _yMax;
			part_emitter_region(ParticleSystem.particleSystem, emitter, xMin, xMax, yMin, yMax, shape, distribution);
		};
	}

	///@function PartEmitterCreate(shape, distribution)

	function PartEmitterCreate(_shape, _distribution)
	{
		PartLazyInit();
		var emitter = new PartEmitter(x, y, _shape, _distribution);
		return emitter;
	}
	
	///@function PartEmitterDestroy(emitter)
	
	function PartEmitterDestroy(emitterStruct)
	{
		part_emitter_destroy(ParticleSystem.particleSystem, emitterStruct.emitter);
		delete emitterStruct;
	}
	
	///@funtion PartEmitterSetRegion(emitter, xMin, xMax, yMin, yMax)
	
	function PartEmitterSetRegion(emitterStruct, xMin, xMax, yMin, yMax)
	{
		emitterStruct.SetRegion(xMin, xMax, yMin, yMax);
	}

	///@function PartEmitStream(emitter, partType, amount)

	function PartEmitStream(emitterStruct, partType, _amount)
	{
		PartLazyInit();
		part_emitter_stream(ParticleSystem.particleSystem, emitterStruct.emitter, ParticleSystem.particleTypes[? partType], _amount);
	}

	///@function PartEmitBurst(emitter, partType, amount)

	function PartEmitBurst(emitterStruct, partType, _amount)
	{
		PartLazyInit();
		part_emitter_burst(ParticleSystem.particleSystem, emitterStruct.emitter, ParticleSystem.particleTypes[? partType], _amount);
	}

#endregion

#region //Particle Type Definitions

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
	
		ds_map_add(particleTypes, PartType.BlackHoleBody, partType);
	
		//particles
		partType = part_type_create();
	
		part_type_shape(partType, pt_shape_pixel);
	
		part_type_size(partType, 10, 20, 0, 0);
	
		part_type_speed(partType, 0.5, 1, 0.2, 0.1);
		part_type_direction(partType, 0, 360, 0, 0);
	
		part_type_color3(partType, c_white, c_white, c_grey);
		part_type_alpha3(partType, 1, 0.8, 0);
	
		part_type_life(partType, 20, 30);
	
		ds_map_add(particleTypes, PartType.BlackHoleParticles, partType);
	}

	///@function PartDefineExplosion()

	function PartDefineExplosion()
	{
		//particle types
		var partType;
		//Flash
		partType = part_type_create();
		part_type_shape(partType, pt_shape_flare);
		part_type_size(partType, 4, 4, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777215, 16777215, 16777215);
		part_type_alpha3(partType, 1, 0.50, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 20, 30);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
	
		ds_map_add(particleTypes, PartType.ExplosionFlash, partType);

		//Blast
		partType = part_type_create();
		part_type_shape(partType, pt_shape_flare);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 65535, 4227327, 10182);
		part_type_alpha3(partType, 1, 0.75, 0.25);
		part_type_blend(partType, 0);
		part_type_life(partType, 20, 30);
		part_type_speed(partType, 2, 5, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
	
		ds_map_add(particleTypes, PartType.ExplosionBlast, partType);

		//Debris
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8421504, 8421504, 8421504);
		part_type_alpha3(partType, 1, 1, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 20, 50);
		part_type_speed(partType, 4, 10, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0.10, 270);
	
		ds_map_add(particleTypes, PartType.ExplosionDebris, partType);

		//Smoke
		partType = part_type_create();
		part_type_shape(partType, pt_shape_cloud);
		part_type_size(partType, 2, 2, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8421504, 8421504, 0);
		part_type_alpha3(partType, 1, 1, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 80, 80);
		part_type_speed(partType, 5, 5, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0.20, 90);
	
		ds_map_add(particleTypes, PartType.ExplosionSmoke, partType);
	}

#endregion