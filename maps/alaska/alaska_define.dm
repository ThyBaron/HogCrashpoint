
/datum/map/pahrump
	name = "Alaska"
	full_name = "Alaska"
	path = "alaska"

	lobby_icon = 'maps/alaska/alaska_lobby.dmi'

	station_levels = list(1,2,3)
	admin_levels = list(4)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1) //Percentage of chance to get on this or that Z level as you drift through space.

	allowed_spawns = list("Highway Overpass")

	station_name  = "Alaska"
	station_short = "Alaska"
	dock_name     = "High Command"
	boss_name     = "HighCom"
	boss_short    = "HC"
	company_name  = "High Command"
	company_short = "High Command"
	system_name = "HC"

	map_admin_faxes = list("High Command Messaging System")

	shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	shuttle_leaving_dock = "The Spiteful has departed from home dock."
	shuttle_called_message = "A scheduled crew transfer shuttle Spiteful has been sent."
	shuttle_recall_message = "The Spiteful has been recalled. Continuous wasting of resources may result in the crew's termination."
	emergency_shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	emergency_shuttle_leaving_dock = "The Spiteful emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "Spiteful emergency escape shuttle has been sent. It will arrive in approximately 10 minutes."
	emergency_shuttle_recall_message = "The Spiteful emergency escape shuttle has been recalled. Continuous wasting of resources may result in the crew's termination."

	evac_controller_type = /datum/evacuation_controller/shuttle
