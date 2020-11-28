/////////
// Primary
/////////

/datum/map/alaska
	allowed_jobs = list(
						/datum/job/wastrel,
						/datum/job/army/officer,
						/datum/job/army/corpsman,
						/datum/job/army/trooper
						)


/////////
// Wastes
/////////

/datum/job/wastrel
	title = "Wastrel"
	department = "Civilian"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	create_record = 0
	account_allowed = 0
	//no_late_join = 1
	selection_color = "#aaaa61"
	outfit_type = /decl/hierarchy/outfit/job/alaska/survivor
	social_class = SOCIAL_CLASS_MIN

	equip(var/mob/living/carbon/human/H)
		..()

		H.generate_stats(STAT_ST)
		H.generate_skills("ranged")

/*		//Some dumb shit.
		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet(H),slot_back)
		else if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty(H),slot_back)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/shitty(H),slot_back)

		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H),slot_wear_mask)*/

		H.religion = ILLEGAL_RELIGION

/////////
// Army
/////////
/datum/job/army//just the base for the rest
	department_flag = SEC
	total_positions = 0
	spawn_positions = 0
	selection_color = "#869e5b"
//	economic_modifier = 0
	create_record = 0
	account_allowed = 0
//	no_late_join = 1
//	sex_lock = MALE
	access = list(access_security, access_armory)
	minimal_access = list(access_security, access_armory)
	minimal_player_age = 2
	outfit_type = /decl/hierarchy/outfit/job/alaska/army
	social_class = SOCIAL_CLASS_MED

	equip(var/mob/living/carbon/human/H)
		..()
		if(!H.religion_is_legal())//Good ol' Christians.
			H.religion = LEGAL_RELIGION
		H.newgeneratestats(12,19,12,19,6,12,14,18)
		H.generate_skills(list("melee","ranged"))

///
// Officer
///
/datum/job/army/officer
	title = "Remnant Officer"
	supervisors = "Your Morals"
	total_positions = 1
	spawn_positions = 1
	access = list(access_security, access_armory)
	minimal_access = list(access_security, access_armory)
	minimal_player_age = 4
	outfit_type = /decl/hierarchy/outfit/job/alaska/army
	social_class = SOCIAL_CLASS_MAX
	rankprefix  = "SGT."

	equip(var/mob/living/carbon/human/H)
		..()
		if(!H.religion_is_legal())//Good ol' Christians.
			H.religion = LEGAL_RELIGION
		H.newgeneratestats(12,21,12,21,12,18,14,18)
		H.generate_skills(list("melee","ranged","crafting"))

///
// Corpsman
///
/datum/job/army/corpsman
	title = "Remnant Corpsman"
	supervisors = "the Officer"
	total_positions = 1
	spawn_positions = 1
	access = list(access_security, access_armory)
	minimal_access = list(access_security, access_armory)
	minimal_player_age = 3
	outfit_type = /decl/hierarchy/outfit/job/alaska/army
	social_class = SOCIAL_CLASS_HIGH
	rankprefix  = "SPC."

	equip(var/mob/living/carbon/human/H)
		..()
		if(!H.religion_is_legal())//Good ol' Christians.
			H.religion = LEGAL_RELIGION
		H.newgeneratestats(12,18,12,18,14,24,14,18)
		H.generate_skills(list("melee","ranged","medical","cleaning", "surgery"))

///
// Trooper
///
/datum/job/army/trooper
	title = "U.S. Remnant"
	supervisors = "the Officer"
	total_positions = 6
	spawn_positions = 6
	access = list(access_security)
	minimal_access = list(access_security)