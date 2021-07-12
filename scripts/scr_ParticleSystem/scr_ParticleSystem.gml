#region //Particle System Set Up

	///@function PartTypeInit()

	function PartTypeInit()
	{
		particleTypes = ds_map_create();
	
		PartDefineBlackHole();
		PartDefineExplosion();
		PartDefineFlameThrower();
		PartDefineGroundFire();
		PartDefineTeslaShot();
		PartDefineShock();
		PartDefineAlphaShield();
		PartDefineBlood();
		PartDefineBHShot();
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
		
		static SetRegion = function(_xMin, _xMax, _yMin, _yMax)
		{
			xMin = _xMin;
			xMax = _xMax;
			yMin = _yMin;
			yMax = _yMax;
			part_emitter_region(ParticleSystem.particleSystem, emitter, xMin, xMax, yMin, yMax, shape, distribution);
		};
		
		static AddRegionSqr = function(_value)
		{
			xMin -= _value;
			xMax += _value;
			yMin -= _value;
			yMax += _value;
			part_emitter_region(ParticleSystem.particleSystem, emitter, xMin, xMax, yMin, yMax, shape, distribution);
		};
		
		static TranslateRegion = function(_x, _y)
		{
			var sizeX = (xMax - xMin) / 2,
				sizeY = (yMax - yMin) / 2;
				
			SetRegion(_x - sizeX, _x + sizeX, _y - sizeY, _y + sizeY);
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
	
	///@function PartDefineFlameThrower()
	

	function PartDefineFlameThrower()
	{
		var partType;
		//Ball
		partType = part_type_create();
		part_type_shape(partType, pt_shape_sphere);
		part_type_size(partType, 0.50, 0.50, 0, 0);
		part_type_scale(partType, 0.75, 0.75);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 65535, 4235519, 255);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 2, 2);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.FlameThrowerBall, partType);

		//Beam
		partType = part_type_create();
		part_type_shape(partType, pt_shape_smoke);
		part_type_size(partType, 0.50, 0.50, 0, 0.10);
		part_type_scale(partType, 0.75, 0.75);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8454143, 65535, 4227327);
		part_type_alpha3(partType, 1, 0.50, 0.20);
		part_type_blend(partType, 0);
		part_type_life(partType, 7, 21);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0.20, 90);
		
		ds_map_add(particleTypes, PartType.FlameThrowerBeam, partType);

		//Spark
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0.10);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8454143, 65535, 4227327);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 10);
		part_type_speed(partType, 5, 5, 0, 0);
		part_type_direction(partType, 0, 180, 0, 0);
		part_type_gravity(partType, 0.10, 90);
		
		ds_map_add(particleTypes, PartType.FlameThrowerSpark, partType);
	}
	
	
	///@function PartDefineGroundFire()
	
	function PartDefineGroundFire()
	{
		var partType;
		//Flame
		partType = part_type_create();
		part_type_shape(partType, pt_shape_smoke);
		part_type_size(partType, 0.25, 0.75, -0.01, 0);
		part_type_scale(partType, 0.5, 0.5);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8454143, 65535, 4227327);
		part_type_alpha3(partType, 0.50, 1, 0.25);
		part_type_blend(partType, 0);
		part_type_life(partType, 30, 40);
		part_type_speed(partType, 2, 5, 0, 0);
		part_type_direction(partType, 70, 110, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.GroundFireFlame, partType);

		//FirePit
		partType = part_type_create();
		part_type_shape(partType, pt_shape_sphere);
		part_type_size(partType, 0.50, 0.50, 0, 0.10);
		part_type_scale(partType, 0.6, 0.6);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777215, 8454143, 65535);
		part_type_alpha3(partType, 0.05, 0.05, 0.05);
		part_type_blend(partType, 0);
		part_type_life(partType, 80, 80);
		part_type_speed(partType, 0, 1, 0, 0);
		part_type_direction(partType, 70, 110, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.GroundFireFirePit, partType);

		//Smoke
		partType = part_type_create();
		part_type_shape(partType, pt_shape_cloud);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 0.5, 0.5);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777215, 16777215, 16777215);
		part_type_alpha3(partType, 0.10, 0.10, 0.10);
		part_type_blend(partType, 0);
		part_type_life(partType, 0, 120);
		part_type_speed(partType, 1, 5, 0, 0);
		part_type_direction(partType, 90, 90, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.GroundFireSmoke, partType);

		//Spark
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 0.50, 0.50, 0, 0.50);
		part_type_scale(partType, 0.5, 0.5);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 8454143, 65535, 4227327);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 0, 80);
		part_type_speed(partType, 5, 5, 0, 0);
		part_type_direction(partType, 70, 110, 0, 0);
		part_type_gravity(partType, 0.05, 270);
		
		ds_map_add(particleTypes, PartType.GroundFireSpark, partType);
	}
	
	///@function PartDefineTeslaShot()

	function PartDefineTeslaShot()
	{
		var partType;
		//Electricity
		partType = part_type_create();
		part_type_shape(partType, pt_shape_line);
		part_type_sprite(partType, spr_Zap, 1, 0, 0);
		part_type_size(partType, 1, 1, 0, 0.50);
		part_type_scale(partType, 0.75, 0.75);
		part_type_orientation(partType, 0, 360, 0.50, 0.50, 0);
		part_type_color3(partType, 16776960, 8404992, 16777215);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 1);
		part_type_life(partType, 10, 20);
		part_type_speed(partType, 1, 2, 0, 1);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.TeslaShotElectricity, partType);

		//Spark
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16776960, 8404992, 16777215);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 5, 5);
		part_type_speed(partType, 20, 40, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.TeslaShotSpark, partType);

		//Trail
		partType = part_type_create();
		part_type_shape(partType, pt_shape_sphere);
		part_type_size(partType, 0.50, 0.50, -0.50, 0.50);
		part_type_scale(partType, 0.75, 0.75);
		part_type_orientation(partType, 0, 360, 0, 0.50, 0);
		part_type_color3(partType, 16777088, 16776960, 8404992);
		part_type_alpha3(partType, 1, 1, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 20);
		part_type_speed(partType, 0, 0, 0, 0.50);
		part_type_direction(partType, 0, 360, 0, 0.50);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.TeslaShotTrail, partType);
	}
	
	///@function PartDefineShock()
	
	function PartDefineShock()
	{
		var partType;
		
		//Shock
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_sprite(partType, spr_Zap, 1, 0, 0);
		part_type_size(partType, 1, 1, 0, 0.50);
		part_type_scale(partType, 0.5, 0.5);
		part_type_orientation(partType, 0, 360, 0, 0, 0);
		part_type_color3(partType, 16776960, 8404992, 16777215);
		part_type_alpha3(partType, 1, 1, 0.50);
		part_type_blend(partType, 1);
		part_type_life(partType, 15, 15);
		part_type_speed(partType, 1, 2, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.ShockShock, partType);

		//Spark1
		partType = part_type_create();
		part_type_shape(partType, pt_shape_spark);
		part_type_size(partType, 0.50, 0.50, 0, 0);
		part_type_scale(partType, 0.5, 0.5);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777088, 16776960, 8404992);
		part_type_alpha3(partType, 1, 0.50, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 20);
		part_type_speed(partType, 20, 20, 0, 0);
		part_type_direction(partType, 31, 151, 0, 0);
		part_type_gravity(partType, 1, 270);
		
		ds_map_add(particleTypes, PartType.ShockSpark1, partType);

		//Spark2
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16776960, 8404992, 16777215);
		part_type_alpha3(partType, 1, 1, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 15, 30);
		part_type_speed(partType, 20, 20, 0, 0);
		part_type_direction(partType, 0, 180, 0, 0);
		part_type_gravity(partType, 0.50, 270);
		
		ds_map_add(particleTypes, PartType.ShockSpark2, partType);
	}
	
	///@PartDefineAlphaShield()
	
	function PartDefineAlphaShield()
	{
		var partType;
		
		//Shield
		partType = part_type_create();
		part_type_shape(partType, pt_shape_ring);
		part_type_size(partType, 2.50, 2.50, 0, 0);
		part_type_scale(partType, 0.25, 0.5);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 255, 255, 255);
		part_type_alpha3(partType, 0.5, 0.25, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 1, 0);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);

		ds_map_add(particleTypes, PartType.AlphaShield, partType);
		
		//Center
		partType = part_type_create();
		part_type_shape(partType, pt_shape_line);
		part_type_size(partType, 2.50, 2.50, 0, 0);
		part_type_scale(partType, 0.33, 0.33);
		part_type_orientation(partType, 0, 0, 0, 0, 1);
		part_type_color3(partType, 255, 255, 255);
		part_type_alpha3(partType, 0.5, 0.25, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 5, 5);
		part_type_speed(partType, 3, 3, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
	ds_map_add(particleTypes, PartType.AlphaCenter, partType);

	}
	
	///@function PartDefineBlood()
	
	function PartDefineBlood()
	{
		var partType;
		
		//Blood
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 255, 255, 255);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 30);
		part_type_speed(partType, 10, 30, 0, 0);
		part_type_direction(partType, 10, 170, 0, 0);
		part_type_gravity(partType, 0.50, 270);
		
		ds_map_add(particleTypes, PartType.BloodBlood, partType);

		//Mist
		partType = part_type_create();
		part_type_shape(partType, pt_shape_explosion);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 1);
		part_type_color3(partType, 255, 255, 255);
		part_type_alpha3(partType, 1, 0.50, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 40);
		part_type_speed(partType, 0, 3, 0, 1);
		part_type_direction(partType, 80, 100, 0, 0);
		part_type_gravity(partType, 0, 90);
		
		ds_map_add(particleTypes, PartType.BloodMist, partType);

	}
	
	///@functionPartDefineBHShot()
	
	function PartDefineBHShot()
	{
		var partType;
		
		//Bullet
		partType = part_type_create();
		part_type_shape(partType, pt_shape_disk);
		part_type_size(partType, 0.50, 0.50, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 0, 4194368, 4194368);
		part_type_alpha3(partType, 1, 0.50, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 5, 5);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.BHBullet, partType);

		//Center
		partType = part_type_create();
		part_type_shape(partType, pt_shape_circle);
		part_type_size(partType, 0.55, 0.55, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777215, 16777215, 16777215);
		part_type_alpha3(partType, 1, 0.50, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 5, 5);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.BHCenter, partType);

		//Trail
		partType = part_type_create();
		part_type_shape(partType, pt_shape_ring);
		part_type_size(partType, 1, 1, 0.02, 0);
		part_type_scale(partType, 1, 0.50);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 0, 4194368, 4194368);
		part_type_alpha3(partType, 1, 1, 0);
		part_type_blend(partType, 0);
		part_type_life(partType, 20, 20);
		part_type_speed(partType, 0, 0, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.BHTrail, partType);

		//Particles
		partType = part_type_create();
		part_type_shape(partType, pt_shape_pixel);
		part_type_size(partType, 1, 1, 0, 0);
		part_type_scale(partType, 1, 1);
		part_type_orientation(partType, 0, 0, 0, 0, 0);
		part_type_color3(partType, 16777215, 16777215, 16777215);
		part_type_alpha3(partType, 1, 1, 1);
		part_type_blend(partType, 0);
		part_type_life(partType, 10, 20);
		part_type_speed(partType, 5, 5, 0, 0);
		part_type_direction(partType, 0, 360, 0, 0);
		part_type_gravity(partType, 0, 0);
		
		ds_map_add(particleTypes, PartType.BHParticles, partType);
	}

#endregion