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
	desc = "Позволяет вам выйти из тела в виде духа."
	clothes_req = 0
	charge_max = 250
	action_icon_state = "spell_default"

/obj/effect/proc_holder/spell/aoe_turf/undead_escape/cast(mob/user = usr)
	var/mob/living/L = usr
	if(!L.MyBody)
		playsound(usr, 'sound/Event/wraith_leave.ogg', VOL_EFFECTS_MASTER)
		L.SetCrawling(!L.crawling)
		L.update_canmove()
		var/mob/living/simple_animal/wraith/W = new /mob/living/simple_animal/wraith(get_turf(usr))
		W.AddSpell(/obj/effect/proc_holder/spell/aoe_turf/undead_escape)
		W.MyBody = L
		L.mind.transfer_to(W)

	if(L.MyBody)
		var/turf/T = get_turf(usr)
		if(L.MyBody in T.contents)
			L.mind.transfer_to(L.MyBody)
			L.MyBody = null
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

//////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/flying
	name = "Полет"
	desc = "Позволяет вам летать."
	charge_max = 12 SECONDS
	invocation = "none"
	clothes_req = 0
	invocation_type = "none"
	range = -1
	include_user = 1
	action_icon_state = "flying"
	var/movement_cooldown = 2 //movement speed, less is faster
	var/flying_duration = 6 SECONDS //how long jaunt will last

/obj/effect/proc_holder/spell/targeted/flying/cast(list/targets) //magnets, so mostly hardcoded
	set waitfor = FALSE

	for(var/mob/living/target in targets)
		if(!target.canmove)
			continue

		var/turf/mobloc = get_turf(target.loc)
		var/obj/effect/dummy/flying/holder = new(mobloc)
		holder.modifier_delay = movement_cooldown
		target.ExtinguishMob()			//This spell can extinguish mob
		target.status_flags ^= GODMODE	//Protection from any kind of damage, caused you in astral world

		var/remove_xray = FALSE
		if(!(XRAY in target.mutations))
			target.mutations += XRAY
			target.update_sight()
			remove_xray = TRUE
		var/icon/flat = getFlatIcon(target, SOUTH, exact = 1)
		holder.master = target
		var/list/companions = handle_teleport_grab(holder, target)
		if(companions)
			for(var/M in companions)
				var/mob/living/L = M
				L.status_flags ^= GODMODE
				L.ExtinguishMob()
		var/image/I = image('icons/mob/blob.dmi', holder, "marker")
		I.plane = HUD_PLANE
		holder.indicator = I
		if(target.client)
			target.client.images += I
			target.forceMove(holder)
			target.client.eye = holder
		holder.set_dir(target.dir)

		holder.flying_up(flat)
		holder.canmove = TRUE
		sleep(flying_duration - 1 SECOND)
		holder.canmove = FALSE
		holder.flying_down()
		sleep(4)
		holder.canmove = TRUE
		mobloc = get_turf(target.loc)
		if(target.client)
			target.client.images -= I
			target.client.eye = target
		target.status_flags ^= GODMODE	//Turn off this cheat
		if(remove_xray)
			target.mutations -= XRAY
			target.update_sight()
		if(companions)
			for(var/M in companions)
				var/mob/living/L = M
				L.status_flags ^= GODMODE
		target.eject_from_wall(gib = TRUE, companions = companions)
		qdel(holder)


/obj/effect/proc_holder/spell/targeted/flying/cast(list/targets)
	..()
	for(var/mob/living/target in targets)
		var/turf/mobloc = get_turf(target.loc)
		mobloc.visible_message("<span class='warning'>[target] [pick("поднимается на крыльях в воздух","взмывает ввысь","взлетает в небеса","устремляется в облака")]!</span>")
		to_chat(target, "<span class='notice'>Вы взлетаете!</span>")
		sleep(flying_duration)
		mobloc = get_turf(target.loc)
		mobloc.visible_message("<span class='warning'>[target] [pick("спускается с небес","прилетает на землю","садится","садится на землю")]!</span>")
		to_chat(target, "<span class='notice'>Вы садитесь на землю.</span>")

/obj/effect/dummy/flying
	name = "water"
	last_move = 0
	density = FALSE
	anchored = TRUE
	layer = FLY_LAYER
	icon = 'icons/mob/mob.dmi'
	icon_state = "blank"
	var/mob/master
	var/canmove = FALSE
	var/image/indicator
	var/modifier_delay = 2
	var/obj/effect/temp_visual/angel_flight/flight_icon
	var/is_flying = FALSE

/obj/effect/temp_visual/angel_flight
	icon = 'icons/mob/Event/Dragon.dmi'
	icon_state = ""
	layer = 99
	randomdir = FALSE
	duration = 1000

/obj/effect/dummy/flying/proc/flying_up(icon/flying_icon)
	is_flying = TRUE
	var/obj/effect/temp_visual/angel_flight/F = new /obj/effect/temp_visual/angel_flight(loc)
	flight_icon = F
	flight_icon.overlays |= flying_icon
	animate(flight_icon, alpha = 180, pixel_x = 10, pixel_z = 200, time = 6)
	sleep(7)
	flying()


/obj/effect/dummy/flying/proc/flying()
	if(flight_icon)
		animate(flight_icon, pixel_y = flight_icon.pixel_y + 5, time = 0.5, loop = 20)
		sleep(2)
		animate(flight_icon, pixel_y = flight_icon.pixel_y - 5, time = 0.5, loop = 20)
	if(is_flying)
		addtimer(CALLBACK(src, .proc/flying), 5)

/obj/effect/dummy/flying/proc/flying_down()
	is_flying = FALSE
	if(flight_icon)
		animate(flight_icon, alpha = 180, pixel_x = 0, pixel_z = 0, time = 3)

/obj/effect/dummy/flying/relaymove(mob/user, direction)
	if(last_move + modifier_delay > world.time)
		return
	if(user != master)
		return
	var/turf/newLoc = get_step(src,direction)
	for(var/obj/effect/proc_holder/spell/targeted/flying/J in master.spell_list)
		if(canmove)
			loc = newLoc
			flight_icon.loc = newLoc
	dir = direction
	last_move = world.time
	if(indicator)
		var/turf/T = get_turf(loc)
		indicator.icon_state = "marker[T.is_mob_placeable() ? "" : "_danger"]"

/obj/effect/dummy/flying/ex_act(blah)
	return

/obj/effect/dummy/flying/bullet_act(obj/item/projectile/P, def_zone)
	return PROJECTILE_ACTED // I think bullet_act should not be called

/obj/effect/dummy/flying/Destroy()
	for(var/atom/movable/AM in src)
		AM.forceMove(get_turf(src))
	master = null
	if(flight_icon)
		qdel(flight_icon)
	QDEL_NULL(indicator)
	return ..()
