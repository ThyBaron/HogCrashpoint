#if !defined(using_map_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "frontier_announcements.dm"
	#include "frontier_areas.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"
	#include "frontier_gamemodes.dm"
	#include "frontier_presets.dm"
	#include "frontier_shuttles.dm"
	#include "frontier_elevator.dm"

	#include "frontier-1.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/frontier

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Frontier
#endif
