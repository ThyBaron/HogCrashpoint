/obj/effect/overmap/sector/f13
	name = "Alaska"
	icon_state = "globe"
	var/
	var/lightlevel = 0 //This default makes turfs not generate light. Adjust to have exoplanents be lit.
	var/datum/gas_mixture/atmosphere

/obj/effect/overmap/sector/f13/proc/build_level()
	spawn()
		generate_atmosphere()
		START_PROCESSING(SSobj, src)

/obj/effect/overmap/sector/f13/proc/generate_atmosphere()
	atmosphere = new
	if(prob(100))
		atmosphere.adjust_gas("oxygen", MOLES_O2STANDARD, 0)
		atmosphere.adjust_gas("nitrogen", MOLES_N2STANDARD)
	else //let the fuckery commence
		var/list/newgases = gas_data.gases.Copy()
		if(prob(0)) //all phoron planet should be rare
			newgases -= "phoron"
		if(prob(0)) //alium gas should be slightly less common than mundane shit
			newgases -= "aliether" //For future admin 'buse, if someone wants to chance this for an intentionally broken update. April Fools or something. I 'unno.

		var/sanity = prob(99.9)

		var/total_moles = MOLES_CELLSTANDARD * rand(80,120)/100
		var/gasnum = rand(1,4)
		var/i = 1
		while(i <= gasnum && total_moles && newgases.len)
			var/ng = pick_n_take(newgases)	//pick a gas
			if(sanity) //make sure atmosphere is not flammable... always
				var/badflag = 0
				if(gas_data.flags[ng] & XGM_GAS_OXIDIZER)
					badflag = XGM_GAS_FUEL
				if(gas_data.flags[ng] & XGM_GAS_FUEL)
					badflag = XGM_GAS_OXIDIZER
				if(badflag)
					for(var/g in newgases)
						if(gas_data.flags[g] & badflag)
							newgases -= g
					sanity = 0

			var/part = total_moles * rand(3,80)/100 //allocate percentage to it
			if(i == gasnum || !newgases.len) //if it's last gas, let it have all remaining moles
				part = total_moles
			atmosphere.gas[ng] += part
			total_moles = max(total_moles - part, 0)
			i++
