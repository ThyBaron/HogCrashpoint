/////////
// Area
/////////
/area/exoplanet/f13
	name = "\improper Alaskan Wastes"
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')

/area/exoplanet/f13/outside
	name = "\improper Alaskan Wastes"
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')

/area/exoplanet/f13/inside
	name = "\improper Alaskan Wastes"
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')

/area/exoplanet/f13/special
	name = "\improper Alaskan Wastes"
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')

/////////
// Walls - Base
/////////

/turf/simulated/wall/f13/r_wall
	icon_state = "rgeneric"

/turf/simulated/wall/f13/r_wall/New(var/newloc)
	..(newloc, "plasteel","plasteel") //3strong

/turf/simulated/wall/f13/ocp_wall
	name = "thermoprotected wall"

/turf/simulated/wall/f13/ocp_wall/New(var/newloc)
	..(newloc, "osmium-carbide plasteel", "osmium-carbide plasteel")

/turf/simulated/wall/f13/rusty
	name = "rusty wall"
	icon_state = "rusty"


/////////
// Walls - Wood
/////////

/turf/simulated/wall/f13/woodcorner
	icon = 'icons/fallout/turfs/walls/wood.dmi'
	icon_state = "wood0"

/turf/simulated/wall/f13/wood1
	icon = 'icons/fallout/turfs/walls/wood.dmi'
	icon_state = "wood3"

/turf/simulated/wall/f13/wood2
	icon = 'icons/fallout/turfs/walls/wood.dmi'
	icon_state = "wood12"

/////////
// Walls - Urban
/////////

/turf/simulated/wall/f13/housecorner
	icon = 'icons/fallout/turfs/walls/house.dmi'
	icon_state = "house0"

/turf/simulated/wall/f13/house1
	icon = 'icons/fallout/turfs/walls/house.dmi'
	icon_state = "house3"

/turf/simulated/wall/f13/house2
	icon = 'icons/fallout/turfs/walls/house.dmi'
	icon_state = "house12"

/////////
// Walls - Industrial
/////////

/turf/simulated/wall/f13/tunnelcorner
	icon = 'icons/fallout/turfs/walls/tunnel.dmi'
	icon_state = "tunnel0"

/turf/simulated/wall/f13/tunnel1
	icon = 'icons/fallout/turfs/walls/tunnel.dmi'
	icon_state = "tunnel3"

/turf/simulated/wall/f13/tunnel2
	icon = 'icons/fallout/turfs/walls/tunnel.dmi'
	icon_state = "tunnel12"

/turf/simulated/wall/f13/ruinscorner
	icon = 'icons/fallout/turfs/walls/ruins.dmi'
	icon_state = "ruins0"

/turf/simulated/wall/f13/ruins1
	icon = 'icons/fallout/turfs/walls/ruins.dmi'
	icon_state = "ruins3"

/turf/simulated/wall/f13/ruins2
	icon = 'icons/fallout/turfs/walls/ruins.dmi'
	icon_state = "ruins12"

/turf/simulated/wall/f13/storecorner
	icon = 'icons/fallout/turfs/walls/superstore.dmi'
	icon_state = "supermart0"

/turf/simulated/wall/f13/store1
	icon = 'icons/fallout/turfs/walls/superstore.dmi'
	icon_state = "supermart3"

/turf/simulated/wall/f13/store2
	icon = 'icons/fallout/turfs/walls/superstore.dmi'
	icon_state = "supermart12"

/////////
// Floors - Base
/////////

/turf/simulated/floor/f13
	name = "only use children, not me"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "plating"
	has_resources = 0
	var/diggable = 0

/turf/simulated/floor/f13/New()
	if(GLOB.using_map.use_overmap)
		var/obj/effect/overmap/sector/exoplanet/E = map_sectors["[z]"]
		if(istype(E))
			if(E.atmosphere)
				initial_gas = E.atmosphere.gas.Copy()
				temperature = E.atmosphere.temperature
			//Must be done here, as light data is not fully carried over by ChangeTurf (but overlays are).
			set_light(E.lightlevel, 0.1, 2)
	..()

/turf/simulated/floor/f13/attackby(obj/item/C, mob/user)
	if(diggable && istype(C,/obj/item/weapon/shovel))
		visible_message("<span class='notice'>\The [user] starts digging \the [src]</span>")
		if(do_after(user, 50))
			to_chat(user,"<span class='notice'>You dig a deep pit.</span>")
			new /obj/structure/pit(src)
			diggable = 0
		else
			to_chat(user,"<span class='notice'>You stop shoveling.</span>")
	else
		..()

/turf/simulated/floor/f13/ex_act(severity)
	switch(severity)
		if(1)
			ChangeTurf(get_base_turf_by_area(src))
		if(2)
			if(prob(40))
				ChangeTurf(get_base_turf_by_area(src))
/*
/turf/simulated/f13/ex_act(severity)
	return
*/
/////////
// Floors - Road
/////////

/turf/simulated/floor/f13/road
	name = "asphalt"
	icon = 'icons/fallout/turfs/asphalt.dmi'
	icon_state = "innermiddle"

/turf/simulated/floor/f13/sidewalk
	name = "asphalt"
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	icon_state = "outermiddle"

/turf/simulated/floor/f13/outer_sidewalk
	name = "asphalt"
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	icon_state = "outershade"

/////////
// Floors - Wood
/////////

/turf/simulated/floor/f13/wood
	name = "wooden floor"
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "housewood1"

/////////
// Floors - Industrial
/////////

/turf/simulated/floor/f13/industrial
	name = "steel floor"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "floorrusty"

/turf/simulated/floor/f13/warn
	name = "steel floor"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "warnplate"

/turf/simulated/floor/f13/warn2
	name = "steel floor"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "warnplatecorner"

/turf/simulated/floor/f13/solar
	name = "solar panel"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "solarpanel"

/turf/simulated/floor/f13/vault
	name = "reinforced floor"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "vault"

/////////
// Floors - Wasteland
/////////

/turf/simulated/floor/f13/scorchedearth//same as jungle, but here for easier use
	name = "scorched earth"
	icon = 'icons/turf/jungle.dmi'
	icon_state = "scorched"

/turf/simulated/floor/f13/snow//same as snow, but here for easier use
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/simulated/floor/f13/snow/New()
	icon_state = pick("snow[rand(1,12)]","snow0")
	..()

/turf/simulated/floor/f13/rubble
	name = "rubble"
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "rubblefull"

/////////
// Floors - Caves/Rocks
/////////

/turf/simulated/floor/f13/rock1
	name = "cave floor"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "rockfloor1"

/turf/simulated/floor/f13/rock2
	name = "cave floor"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "rockfloor2"

/turf/simulated/floor/f13/basalt
	name = "cave floor"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "basalt"

/turf/simulated/floor/f13/ash
	name = "cave floor"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "ash"

/turf/simulated/floor/f13/rockyash
	name = "cave floor"
	icon = 'icons/fallout/turfs/mining.dmi'
	icon_state = "rockyash"

/////////
// Decals
/////////
/obj/effect/decal/roadline
	name = "roadline"
	desc = "Woah'm."
	density = 0
	anchored = 1
	layer = DECAL_LAYER
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "doublevertical"
