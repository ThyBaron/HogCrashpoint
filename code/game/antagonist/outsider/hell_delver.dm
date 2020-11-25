GLOBAL_DATUM_INIT(delver, /datum/antagonist/delver, new)

/datum/antagonist/delver
	id = MODE_DELVER
	role_text = "Hell Delver"
	role_text_plural = "Hell Delvers"
	welcome_text = "A destitute individual, doomed to wander the wastes in search of death."
	antag_text = "You are a<b>survivor.</b> Wander the wastes and try not to die"
	leader_welcome_text = "You shouldn't see this"
	landmark_id = "Hell Spawn"
	id_type = /obj/item/weapon/card/id/centcom/ERT

	flags = ANTAG_OVERRIDE_JOB | ANTAG_HAS_LEADER | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED
	antaghud_indicator = "hudloyalist"

	hard_cap = 25
	hard_cap_round = 25
	initial_spawn_req = 1
	initial_spawn_target = 10
	show_objectives_on_creation = 0 //we are not antagonists, we do not need the antagonist shpiel/objectives

/datum/antagonist/delver/create_default(var/mob/source)
	var/mob/living/carbon/human/M = ..()
	if(istype(M)) M.age = rand(25,45)

/datum/antagonist/delver/Initialize()
	..()
	leader_welcome_text = "You have no leaders"

/datum/antagonist/delver/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "You're all alone. Beware the dark.")

/datum/antagonist/delver/equip(var/mob/living/carbon/human/player)

	//Special radio setup
	player.equip_to_slot_or_del(new /obj/item/clothing/under/soviet(src), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/device/flashlight/lantern(src), slot_belt)
	player.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty (src), slot_back)
	player.equip_to_slot_or_del(new /obj/item/stack/bullets/rifle(5), slot_l_store)
	player.equip_to_slot_or_del(new /obj/item/stack/bullets/rifle(5), slot_r_store)
	player.equip_to_slot_or_del(new	/obj/item/clothing/shoes/black, slot_shoes)
	player.generate_stats(STAT_ST)
	player.generate_skills("melee", "ranged")

	create_id(role_text, player)
	return 1

client/verb/JoinHellDelverTeam()

	set name = "Join Hell Delver Squad"
	set category = "IC"
	set hidden = 0

	if(GAME_STATE < RUNLEVEL_GAME)
		to_chat(src, "Hell is closed.")
		return 0
	if(!MayRespawn(1))
		to_chat(usr, "<span class='warning'>You cannot join the delver squad.</span>")
		return
	if(isghost(usr) || isnewplayer(usr))
		if(GLOB.delver.current_antagonists.len >= GLOB.delver.hard_cap)
			to_chat(usr, "Hell is already full!")
			return
		GLOB.delver.create_default(usr)
	else
		to_chat(usr, "You need to be an observer or new player to use this.")