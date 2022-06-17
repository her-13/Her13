/obj/effect/proc_holder/spell/aoe_turf/lepr_escape
	name = "Побег"
	desc = "Возвращает вас в логово Жадности."
	clothes_req = 0
	charge_max = 50
	var/list/turf/possible_tile
	var/target
	action_icon_state = "spell_default"

/obj/effect/proc_holder/spell/aoe_turf/lepr_escape/cast(mob/user = usr)
	possible_tile = get_area_turfs(get_area_by_type(/area/lepr))
	target = pick(possible_tile)
	playsound(usr, 'sound/Event/lepr_escape.ogg', VOL_EFFECTS_MASTER)
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.set_up(5, 0, usr.loc)
	smoke.attach(usr.loc)
	smoke.start()
	usr.loc = target

/obj/effect/proc_holder/spell/aoe_turf/undead_escape
	name = "Выход из тела"
	desc = "Позволяет вам выйти из тела ввиде духа."
	clothes_req = 0
	charge_max = 250
	action_icon_state = "spell_default"
	var/mob/living/carbon/human/MyBody = null

/obj/effect/proc_holder/spell/aoe_turf/undead_escape/cast(mob/user = usr)
	if(!MyBody)
		playsound(usr, 'sound/Event/wraith_leave.ogg', VOL_EFFECTS_MASTER)
		MyBody = usr
		var/mob/living/simple_animal/wraith/W = new /mob/living/simple_animal/wraith(get_turf(usr))
		usr.mind.transfer_to(W)

	if(MyBody)
		var/turf/T = get_turf(usr)
		if(MyBody in T.contents)
			usr.mind.transfer_to(MyBody)
			for(var/obj/effect/proc_holder/spell/aoe_turf/undead_escape/U in MyBody.spell_list)
				U.MyBody = null
			qdel(usr)

		else
			to_chat(usr, "<span class='warning'>Вы должны стоять на своем теле, чтобы вселиться в него</span>")

//////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/in_hand/death_cloud // for liches and bitches
	name = "Облако Смерти"
	desc = "Выстреливает облаком смерти в цель и вызывает рвотные позывы."
	school = "evocation"
	action_icon_state = "deathcloud"
	summon_path = /obj/item/weapon/magic/deathcloud
	charge_max = 180
	clothes_req = 0

/obj/item/weapon/magic/deathcloud
	name = "Облако Смерти"
	invoke = "LICHI HUICHI"
	icon_state = "deathcloud"
	s_fire = 'sound/magic/Deathcloud.ogg'
	proj_path = /obj/item/projectile/magic/deathcloud

/obj/item/projectile/magic/deathcloud
	name = "Облако Смерти"
	icon_state = "deathcloud"
	damage = 0
	damage_type = BRUTE
	nodamage = 0

/obj/item/projectile/magic/deathcloud/on_hit(atom/target, def_zone = BP_CHEST, blocked = 0)
	new /obj/effect/effect/deathcloud(get_turf(target))
	var/datum/effect/effect/system/smoke_spread/chem/S = new
	create_reagents(30)
	reagents.add_reagent("thermopsis", 30)
	S.attach(get_turf(target))
	S.set_up(reagents, 2, 0, get_turf(target))
	S.color = "#013220" //dark green
	S.start()
	return ..()


/obj/effect/effect/deathcloud
	name = "Облако Смерти"
	icon = 'icons/obj/Events/effect64x64.dmi'
	icon_state = "deathcloud"
	anchored = TRUE
	density = FALSE
	layer = 7
	animate_movement = FALSE
	pixel_x = -16
	pixel_y = -16

/obj/effect/effect/deathcloud/atom_init()
	. = ..()
	playsound(get_turf(src), 'sound/magic/Smoke.ogg', VOL_EFFECTS_MASTER)
	addtimer(CALLBACK(src, .proc/anim_end), 2 SECONDS)

/obj/effect/effect/deathcloud/proc/anim_end()
	qdel(src)
