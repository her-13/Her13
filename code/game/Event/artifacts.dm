/obj/structure/closet/crate/miningcar/unlimited_wood
	name = "Странная тележка"
	desc = "Ощущается странность"

/obj/structure/closet/crate/miningcar/unlimited_wood/open()
	..()
	new/obj/item/stack/sheet/wood(loc)

/obj/structure/closet/crate/miningcar/unlimited_silver
	name = "Странная тележка"
	desc = "Ощущается странность"

/obj/structure/closet/crate/miningcar/unlimited_silver/open()
	..()
	new/obj/item/weapon/ore/silver(loc)

/obj/item/shakal_skull
	name = "Проклятый Череп Шакала"
	desc = "Не трогай его"
	icon = 'icons/obj/items.dmi'
	icon_state = "skull_shakal"
	item_state = ""

/obj/item/shakal_skull/pickup(mob/user)
	..()
	user.add_filter("wave_filter",1,wave_filter(0,3))

/obj/item/weapon/shield/magical_shit
	name = "Волшебный щит"
	desc = "Этот артефакт отразит любой снаряд."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "magical_shit"
	force = 5.0
	throw_speed = 1
	throw_range = 2
	attack_verb = list("shoved", "bashed")
	block_chance = 40
	w_class = SIZE_NORMAL

//100 percent chance to block ANY projectile.
/obj/item/weapon/shield/magical_shit/IsReflect(def_zone, hol_dir, hit_dir)
	if(prob(100) && is_the_opposite_dir(hol_dir, hit_dir))
		return TRUE
	return FALSE