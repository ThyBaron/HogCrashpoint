#if !defined(using_map_DATUM)

	#include "../shared/exodus_torch/_include.dm"

//primary
	#include "alaska_define.dm"
	#include "alaska.dmm"
//

//misc
	#include "alaska_id.dm"
	#include "alaska_jobs.dm"
	#include "alaska_outfits.dm"
//

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/alaska

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Alaska
#endif
