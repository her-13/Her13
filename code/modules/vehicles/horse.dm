/obj/vehicle/space/spacebike/horse
	name = "Лошадь"
	desc = "Это треть бюджета всего селения"
	icon = 'icons/obj/Events/horse.dmi'
	icon_state = "horse_off"
	land_speed = 2
	bike_icon = "horse"
	kickstand = 0
	light_range = 0
	on = 1
	pixel_x = -5
	pixel_y = -5
	var/list/alllowed_species

/obj/vehicle/space/spacebike/horse/atom_init()
	. = ..()
	turn_on()
	alllowed_species = live_species

/obj/vehicle/space/spacebike/horse/proc/check_species(mob/M)
	if(!ishuman(M))
		return FALSE
	var/mob/living/carbon/human/H = M
	if(!(H.species.name in alllowed_species))
		to_chat(H, "<span class='danger'>Лошадь укусила вас!</span>")
		var/obj/item/organ/external/BP = H.get_bodypart(BP_ACTIVE_ARM)
		BP.take_damage(15, 0, 0, "horse")
		H.playsound_local(H, 'sound/weapons/bite.ogg', VOL_EFFECTS_MASTER)
		return FALSE
	to_chat(H, "<span class='notice'>Вы лихо вскакиваете на лошадь!</span>")
	return TRUE

/obj/vehicle/space/spacebike/horse/load(mob/living/M)
	if(!check_species(M))
		return FALSE
	. = ..()

/obj/vehicle/space/spacebike/update_icon()
	cut_overlays()
	if(on)
		add_overlay(image(icon, "[bike_icon]_on_overlay", MOB_LAYER + 1))
		icon_state = "[bike_icon]_on"
	else
		icon_state = "[bike_icon]_off"

/obj/vehicle/space/spacebike/horse/undead
	name = "Мертвая лошадь"
	desc = "Это треть бюджета всего селения"
	icon = 'icons/Events//structure/undead_horse.dmi'

/obj/vehicle/space/spacebike/horse/undead/atom_init()
	. = ..()
	alllowed_species = undead_species
