/obj/structure/character_spawner
	name = "СТАРТ"
	desc = "Нажми на меня если закончил выбор внешности и прочитал все таблички."
	anchored = TRUE
	icon = 'icons/turf/areas.dmi'
	icon_state = "start"
	var/list/turf/possible_tile
	var/outfit = null
	var/ready = null
	var/area/A
	var/target
	var/selecting_job = FALSE
	var/arrive_sound
	var/datum/species/homm_species = HUMAN

/obj/structure/character_spawner/attack_hand(mob/living/carbon/human/user)
	if(!selecting_job)
		selecting_job = TRUE
		ready = tgui_alert(user, "Готовы войти в игру? Убедитесь что прочитали все подсказки и закончили выбор своей внешности.",, list("Да","Нет"))
	else
		return
	if(ready == "Нет")
		selecting_job = FALSE
		return
	for(var/obj/item/W in user)
		user.drop_from_inventory(W)
		qdel(W)
	user.equipOutfit(outfit)
	possible_tile = get_area_turfs(get_area_by_type(A))
	target = pick(possible_tile)
	user.loc = target
	user.set_species(homm_species)
	user.revive() // На всякий случай
	selecting_job = FALSE
	if(arrive_sound)
		playsound(user,arrive_sound, VOL_EFFECTS_MASTER)


/obj/structure/hell_spawner //То что призывает игроков из Ада. Не только для нежити , но я для големов и тому подобное.
	name = "СТАРТ"
	desc = "Нажми на меня чтобы вернуться в игру, за призываемого юнита"
	anchored = TRUE
	icon = 'icons/turf/areas.dmi'
	icon_state = "start"
	layer = 13
	var/outfit = null
	var/ready = null
	var/target
	var/selecting_job = FALSE
	var/arrive_sound
	var/datum/species/homm_species = HOMM_SKELETON

/obj/structure/hell_spawner/attack_hand(mob/living/carbon/human/user)
	if(!selecting_job)
		selecting_job = TRUE
		ready = tgui_alert(user, "Готовы войти в игру? Убедитесь что прочитали все подсказки и закончили выбор своей внешности.",, list("Да","Нет"))
	else
		return
	if(ready == "Нет")
		selecting_job = FALSE
		return
	for(var/obj/item/W in user)
		user.drop_from_inventory(W)
		qdel(W)
	user.equipOutfit(outfit)
	user.loc = target
	user.set_species(homm_species)
	user.revive() // навсякий случай
	selecting_job = FALSE
	qdel(src) //одноразовые
	if(arrive_sound)
		playsound(user,arrive_sound, VOL_EFFECTS_MASTER)

// ЭРАФИЯ

/obj/structure/character_spawner/peasant
	outfit = /datum/outfit/job/hub/peasant
	A =/area/custom/start_homm/peasant
	arrive_sound = 'sound/Event/peasant.ogg'

/obj/structure/character_spawner/smith
	outfit = /datum/outfit/job/hub/smith
	A =/area/custom/start_homm/smith
	arrive_sound = 'sound/Event/smith.ogg'

/obj/structure/character_spawner/miner
	outfit = /datum/outfit/job/hub/miner
	A =/area/custom/start_homm/miner
	arrive_sound = 'sound/Event/miner.ogg'

/obj/structure/character_spawner/helper
	outfit = /datum/outfit/job/hub/helper
	A =/area/custom/start_homm/helper
	arrive_sound = 'sound/Event/helper.ogg'

/obj/structure/character_spawner/doctor
	outfit = /datum/outfit/job/hub/plague_doctor
	A =/area/custom/start_homm/doctor
	arrive_sound = 'sound/Event/doctor.ogg'


/obj/structure/character_spawner/headman
	outfit = /datum/outfit/job/hub/headman
	A =/area/custom/start_homm/headman
	arrive_sound = 'sound/Event/headman.ogg'

/obj/structure/character_spawner/innkeeper
	outfit = /datum/outfit/job/hub/innkeeper
	A =/area/custom/start_homm/innkeeper
	arrive_sound = 'sound/Event/innkeeper.ogg'

/obj/structure/character_spawner/knight
	outfit = /datum/outfit/job/hub/knight
	A = /area/custom/start_homm/knight
	arrive_sound = 'sound/Event/knight.ogg'

/obj/structure/character_spawner/monk
	outfit = /datum/outfit/job/hub/monk
	A = /area/custom/start_homm/monk

/obj/structure/character_spawner/monk/attack_hand(mob/user)
	..()
	if(ready == "Нет")
		selecting_job = FALSE
		return
	global.monk_religion.add_member(user, HOLY_ROLE_HIGHPRIEST)
	user.AddSpell(new /obj/effect/proc_holder/spell/in_hand/arcane_barrage)
	user.mutations.Add(TK)
	user.verbs += /mob/living/carbon/human/proc/remotesay
	user.verbs += /mob/proc/toggle_telepathy_hear
	user.verbs += /mob/proc/telepathy_say
	user.update_mutations()

/obj/structure/character_spawner/human_hero
	outfit = /datum/outfit/job/hub/human_hero
	A = /area/custom/start_homm/human_hero
	arrive_sound = 'sound/Event/hero.ogg'

/obj/structure/character_spawner/human_hero/attack_hand(mob/user)
	..()
	if(ready == "Нет")
		selecting_job = FALSE
		return
	new/obj/vehicle/space/spacebike/horse(user.loc)

/obj/structure/hell_spawner/angel
	name = "Ангел"
	desc = ""
	outfit = /datum/outfit/job/hub/angel
	homm_species = ANGEL


/obj/structure/hell_spawner/angel/attack_hand(mob/living/carbon/human/user)
	target = pick(get_area_turfs(get_area_by_type(/area/custom/start_homm/angel)))
	..()
	global.monk_religion.add_member(user, HOLY_ROLE_HIGHPRIEST)

//НЕЙТРАЛЫ
/obj/structure/character_spawner/lepr
	outfit = /datum/outfit/job/hub/lepr
	A =/area/custom/start_homm/lepr
	arrive_sound = 'sound/Event/headman.ogg'
	homm_species = LEPR

/obj/structure/character_spawner/lepr/attack_hand(mob/living/carbon/human/user) // only a human can become lepr
	..()
	if(ready == "Нет")
		selecting_job = FALSE
		return
	user.mutations.Add(SMALLSIZE)
	user.regenerate_icons()
	user.see_invisible = 34 // so he can see the tree of greed
	user.homm_species = "lepr"
	cameranet.cameras += user
	cameranet.addCamera(user)
	cameranet.updateVisibility(user, 0)

/obj/structure/character_spawner/kazak
	outfit = /datum/outfit/job/hub/kazak
	A =/area/custom/start_homm/kazak

/obj/structure/character_spawner/kazak_elder
	outfit = /datum/outfit/job/hub/kazak_elder
	A =/area/custom/start_homm/kazak_elder

/obj/structure/character_spawner/forest_archer
	outfit = /datum/outfit/job/hub/forest_archer
	A =/area/custom/start_homm/w_archer

/obj/structure/character_spawner/forest_knight
	outfit = /datum/outfit/job/hub/forest_knight
	A =/area/custom/start_homm/w_knight

/obj/structure/character_spawner/bard
	outfit = /datum/outfit/job/hub/bard
	A =/area/custom/start_homm/bard

/obj/structure/character_spawner/farseer
	outfit = /datum/outfit/job/hub/farseer
	A =/area/custom/start_homm/farseer

/obj/structure/character_spawner/valera
	outfit = /datum/outfit/job/hub/valera
	A =/area/custom/start_homm/valera
	homm_species = VALERA

/obj/structure/character_spawner/valera/attack_hand(mob/living/carbon/human/user)
	..()
	if(ready == "Нет")
		selecting_job = FALSE
		return
	if(user.f_style)
		user.f_style = "Shaved"
	if(user.h_style)
		user.h_style = "Bald"
	user.height = HUMANHEIGHT_MEDIUM
	user.update_hair()
	user.update_body()
	user.regenerate_icons()


/obj/structure/character_spawner/tree_of_greed

/obj/structure/character_spawner/tree_of_greed/attack_hand(mob/living/carbon/human/user)
	if(!selecting_job)
		selecting_job = TRUE
		ready = tgui_alert(user, "Готовы войти в игру? Убедитесь что прочитали все подсказки и закончили выбор своей внешности.",, list("Да","Нет"))
	else
		return
	if(ready == "Нет")
		selecting_job = FALSE
		return
	for(var/obj/structure/tree_of_greed_startingpoint/TR in trees_of_greed_overmind_list)
		var/client/newTree = user.client
		TR.create_overmind(newTree)
		selecting_job = FALSE

//НЕКРОПОЛИС
/obj/structure/character_spawner/lich
	outfit = /datum/outfit/job/hub/lich
	A =/area/custom/start_homm/lich
	homm_species = LICH

/obj/structure/character_spawner/lich/attack_hand(mob/living/carbon/human/user)
	arrive_sound = pick("sound/Event/lich.ogg","sound/Event/lich-1.ogg","sound/Event/lich-2.ogg")
	..()
/obj/structure/hell_spawner/coffin
	name = "Скелет"
	desc = ""
	outfit = /datum/outfit/job/hub/skeleton
	var/obj/structure/coffin/myCoffin
	var/mob/myMaster

/obj/structure/hell_spawner/coffin/attack_hand(mob/living/carbon/human/user)
	..()
	if(ready == "Нет")
		selecting_job = FALSE
		return
	arrive_sound = pick("sound/Event/undead_arrive.ogg","sound/Event/undead_arrive-1.ogg","sound/Event/undead_arrive-2.ogg")
	myCoffin.icon_state = myCoffin.open_state
	to_chat(user, "<span class='warning'>Теперь ты живой мертвец.[myMaster.name] твой мастер. Служи и выполняй все приказы мастера.</span>")
	user.nutrition = 100 // Голодный , нужно бахнуть магии
	user.AddComponent(/datum/component/bounded_lich, myCoffin.L, 0, 5)
	var/new_name = sanitize(input(user, "Выберите имя.", "Создание персонажа") as null|text)
	if(new_name)
		user.real_name = new_name
		user.name = new_name

/obj/structure/hell_spawner/coffin/warrior
	name = "Скелет-воин"
	desc = ""
	outfit = /datum/outfit/job/hub/skeleton/warrior

/* Uncomment this if you want to give skeletons a chance to choose their hair
	var/new_facial = input(user, "Выберите цвет растительности на лице.", "Создание персонажа") as color
	if(new_facial)
		user.r_facial = hex2num(copytext(new_facial, 2, 4))
		user.g_facial = hex2num(copytext(new_facial, 4, 6))
		user.b_facial = hex2num(copytext(new_facial, 6, 8))

	var/new_hair = input(user, "Выберите цвет прически.", "Создание персонажа") as color
	if(new_hair)
		user.r_hair = hex2num(copytext(new_hair, 2, 4))
		user.g_hair = hex2num(copytext(new_hair, 4, 6))
		user.b_hair = hex2num(copytext(new_hair, 6, 8))

	// hair
	var/list/all_hairs = subtypesof(/datum/sprite_accessory/hair)
	var/list/hairs = list()

	// loop through potential hairs
	for(var/x in all_hairs)
		var/datum/sprite_accessory/hair/hair = new x // create new hair datum based on type x
		hairs.Add(hair.name) // add hair name to hairs
		qdel(hair) // delete the hair after it's all done

	//hair
	var/new_hstyle = input(user, "Выберите прическу", "Внешность")  as null|anything in get_valid_styles_from_cache(hairs_cache, HUMAN)
	if(new_hstyle)
		user.h_style = new_hstyle

	// facial hair
	var/new_fstyle = input(user, "Выберите стиль растительности на лице", "Внешность")  as null|anything in get_valid_styles_from_cache(facial_hairs_cache, HUMAN)
	if(new_fstyle)
		user.f_style = new_fstyle

	user.apply_recolor()
	user.update_hair()
	user.update_body()*/

/obj/structure/character_spawner/death_knight
	outfit = /datum/outfit/job/hub/death_knight
	A =/area/custom/start_homm/zombie_knight
	homm_species = ZOMBIE_KNIGHT

/obj/structure/character_spawner/death_knight/attack_hand(mob/living/carbon/human/user)
	arrive_sound = pick("sound/Event/dk.ogg","sound/Event/dk-1.ogg","sound/Event/dk-2.ogg")
	..()

/obj/structure/character_spawner/NecroHeroSpawner
	outfit = /datum/outfit/job/hub/arc_lich
	A =/area/custom/start_homm/necro_hero
	homm_species = LICH


