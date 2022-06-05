/area/lepr
	name = "Логово Жадности"
	icon_state = "green"
	ambience = list(
		'sound/ambience/lepr1.ogg',
		'sound/ambience/lepr2.ogg',)
	is_force_ambience = TRUE

/obj/effect/portal/hub/lepr
	name = "На повехность"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bluespace_wormhole_enter"
	A = /area/custom/lepr_exit

/obj/effect/portal/hub/lepr/Bumped(mob/M)
	possible_tile = get_area_turfs(get_area_by_type(A))
	target = pick(possible_tile)
	..()
