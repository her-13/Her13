/datum/religion/monk
	name = "Эрафиянство"
	deity_names_by_name = list(
		"Эрафиянство" = list("Оракул")
	)

	bible_info_by_name = list(
		"Эрафиянство" = /datum/bible_info/chaplain/bible,
	)

	emblem_info_by_name = list(
		"Эрафиянство" = "christianity",
	)

	altar_info_by_name = list(
		"Эрафиянство" = "chirstianaltar",
	)

	carpet_type_by_name = list(
		"Эрафиянство" = /turf/simulated/floor/carpet,
	)

	carpet_dir_by_name = list(
		"Эрафиянство" = 2,
	)

	binding_rites = list(
		/datum/religion_rites/standing/consent/invite,
		/datum/religion_rites/instant/communicate,
		/datum/religion_rites/instant/spawn_item/cult/talisman,
		/datum/religion_rites/standing/illuminate,
		/datum/religion_rites/standing/pray,
	)

	has_aspects = FALSE

	bible_type = /obj/item/weapon/storage/bible
	religious_tool_type = /obj/item/weapon/storage/bible
	area_type = /area/station/civilian/chapel

	favor = 1000
	max_favor = 10000

	style_text = "piety"
	symbol_icon_state = "nimbus"

/datum/religion/monk/setup_religions()
	global.monk_religion = src
	all_religions += src

	for(var/obj/structure/altar_of_gods/monk/M as anything in monk_altars)
		M.attach_religion(src)
