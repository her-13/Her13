SUBSYSTEM_DEF(daylight)
	name = "Daylight"
	msg_lobby = "Делаем натуральное искусственное освещение..."
	init_order = SS_INIT_DAYLIGHT
	wait       = SS_WAIT_DAYLIGHT

	flags = SS_POST_FIRE_TIMING

	var/min_brightness = 0
	var/max_brightness = 2
	var/dawn = 5
	var/sunrise = 15
	var/sunset = 20
	var/dusk = 28


	var/current_hour = 0
	var/list/turfs = list(  /turf/simulated/floor/grass,
							/turf/simulated/floor/necrgrass,
							/turf/simulated/floor/sett,
							/turf/simulated/floor/stone,
							/turf/simulated/floor/beach/water
	)


/datum/controller/subsystem/daylight/fire()
	current_hour = (current_hour + 1) % (dawn + sunrise + sunset + dusk)
	var/brightness = 0
	if (current_hour < dawn)
		brightness = 0.5
	else if (current_hour < sunrise)
		brightness = 1
	else if (current_hour < sunset)
		brightness = 0.25
	else if (current_hour < dusk)
		brightness = 0
	for (var/turf_type in turfs)
		for (var/turf/T in world)
			if(!istype(T, turf_type))
				continue
			T.light_power = brightness
