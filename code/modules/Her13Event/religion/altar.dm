var/global/list/obj/structure/altar_of_gods/monk/monk_altars

ADD_TO_GLOBAL_LIST(/obj/structure/altar_of_gods/monk, monk_altars)

/obj/structure/altar_of_gods/monk
	name = "Алтарь"
	desc = "Здесь вы молитесь Ораклу."

	chosen_aspect = TRUE

/obj/structure/altar_of_gods/monk/atom_init()
	. = ..()
	if(global.monk_religion)
		attach_religion(global.monk_religion)

/obj/structure/altar_of_gods/monk/proc/attach_religion(datum/religion/R)
	religion = R
	religion.altars |= src
