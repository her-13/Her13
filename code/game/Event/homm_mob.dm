/mob/living/simple_animal/hostile/troglodit
	name = "Троглодит"
	desc = "Это его пещера"
	icon = 'icons/Events/mob/troglodit.dmi'
	icon_state = "troglodit"
	icon_dead = "troglodit_dead"
	faction = "Nigon"
	butcher_results  = list(/obj/item/weapon/reagent_containers/food/snacks/hugemushroomslice = 3)
	health = 50
	maxHealth = 50
	speed = 3
	melee_damage = 11

/mob/living/simple_animal/hostile/creature/ahaha
	name = "Землянной элементаль"
	desc  = "Ищи себя в выебаных дермо-демонами"
	icon = 'icons/mob/amorph.dmi'
	icon_state = "standing"
	icon_dead = "lying"
	melee_damage = 15

/mob/living/simple_animal/hostile/beholder
	name = "Злобоглаз"
	desc = "Он сглазит тебя"
	icon = 'icons/Events/mob/beholder.dmi'
	icon_state = "beholder"
	icon_living = "beholder"
	icon_dead = "beholder_dead"
	faction = "Nigon"
	speak_chance = 25
	speak = list("РЕЕЕЕЕ")
	speak_emote = list("кричит")
	ranged = TRUE
	ranged_message = "пялится"
	melee_damage = 10
	turns_per_move = 1
	retreat_distance = 5
	minimum_distance = 5
	projectiletype = /obj/item/projectile/temp/beholder
	projectilesound = 'sound/Event/beholder.ogg'
	stop_automated_movement_when_pulled = FALSE
	w_class= SIZE_HUMAN
	var/my_type = 1
	speed = 3


/obj/item/projectile/temp/beholder
	name = ""
	icon_state = "ice_2"
	desc = "Ты как это осмотрел блять?"
	damage = 0
	damage_type = BURN
	nodamage = 1
	flag = "energy"
	temperature = 50
	var/type_of_cursed
	var/isChickenCurse = FALSE

/obj/item/projectile/temp/beholder/on_hit(atom/target, def_zone = BP_CHEST, blocked = 0)
	..()
	var/mob/living/L = target
	if(isChickenCurse)
		if(isliving(L)&&((ishuman(L))||(istype(L,/mob/living/simple_animal/hostile/beholder))))
			L.MyTrueNotChikenBody = target
			var/mob/living/simple_animal/chicken/C = new/mob/living/simple_animal/chicken(L.loc)
			if(L.mind)
				L.mind.transfer_to(C)
				C.MyTrueNotChikenBody = L.MyTrueNotChikenBody
			playsound(L, 'sound/Event/cursed.ogg', VOL_EFFECTS_MASTER)
			L.loc = null
		else
			return


/obj/item/projectile/temp/beholder/atom_init()
	..()
	type_of_cursed = rand(0,2)
	switch(type_of_cursed)
		if(0)
			name = "Леденящий снаряд"
			icon_state = "ice_2"
			temperature = 50
		if(1)
			name = "Огненный снаряд"
			icon_state = "red_1"
			temperature = 400
		if(2)
			name = "КУРИНЫЙ СНАРЯД"
			icon_state = "bluespace"
			temperature = 0
			isChickenCurse = TRUE
/mob/living/simple_animal/hostile/gorgona
	name = "Горгона"
	desc = "Не нужно ждать доброго от коровы с каменной кожей."
	icon = 'icons/Events/mob/gorgona.dmi'
	icon_state = "gorgona"
	icon_dead = "gorgona_dead"
	speak = list("МУУУУ")
	speak_emote = list("мычит")
	faction = "tataliya"
	speak_chance = 10
	turns_per_move = 4
	speed = 3
	see_in_dark = 6
	maxHealth = 100
	health = 100
	melee_damage = 10
	attacktext = "бодает"
	attack_sound = list('sound/voice/cowmoos.ogg')
	var/datum/reagents/gorgona_udder = null

/mob/living/simple_animal/hostile/gorgona/atom_init()
	gorgona_udder = new(50)
	gorgona_udder.add_reagent("milk", 50)
	gorgona_udder.my_atom = src
	. = ..()

/mob/living/simple_animal/hostile/gorgona/Destroy()
	QDEL_NULL(gorgona_udder)
	return ..()

/obj/structure/gorgona_victim
	name = ""
	desc = ""

/mob/living/simple_animal/hostile/gorgona/AttackingTarget()
	..()
	if(prob(5))
		var/mob/living/L = target
		var/obj/structure/gorgona_victim/V = new/obj/structure/gorgona_victim(L.loc)
		V.icon = L.icon
		V.icon_state = L.icon_state
		V.appearance = L.appearance
		V.layer = L.layer
		V.plane = L.plane
		V.color = list(0.33, 0.33, 0.33, 0, 0.59, 0.59, 0.59, 0, 0.11, 0.11, 0.11, 0, 0,    0,    0,    1, 0,    0,    0,    0)
		V.name = "Жертва Горгоны"
		V.desc = "Это существо не знало или забыло, то что горгоны могут превращать взглядом в камень.."
		L.death()
		qdel(L)

/mob/living/simple_animal/hostile/gorgona/attackby(obj/item/O, mob/user)
	if(stat == CONSCIOUS && istype(O, /obj/item/weapon/reagent_containers/glass))
		user.visible_message("<span class='notice'>[user] ДОЕТ ГОРГОНУ. НАДЕЮСЬ ЕМУ ХОТЯ БЫ НРАВИТСЯ \the [O].</span>")
		var/obj/item/weapon/reagent_containers/glass/G = O
		var/transfered = gorgona_udder.trans_id_to(G, "milk", rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			to_chat(user, "<span class='warning'>[O] заполнено молоком.</span>")
		if(!transfered)
			to_chat(user, "<span class='warning'> No milk?</span>")
	else
		..()

/mob/living/simple_animal/hostile/dragonfly
	name = "Змий"
	desc = "Летающий шланг. Опасен"
	icon = 'icons/Events/mob/dragonfly.dmi'
	icon_state = "dragonfly"
	icon_dead = "dragonfly_dead"
	speak = list("ВЖЖЖЖЖ")
	speak_emote = list("жужит")
	faction = "tataliya"
	speak_chance = 20
	turns_per_move = 4
	speed = 5
	see_in_dark = 6
	maxHealth = 30
	health = 30
	melee_damage = 5
	attacktext = "Жалит"
	attack_sound = list('sound/weapons/bite.ogg')

/mob/living/simple_animal/hostile/dragonfly/AttackingTarget()
	..()
	var/mob/living/L = target
	L.reagents.add_reagent("stoxin", 5)

/mob/living/simple_animal/wraith
	name = "Привидение"
	desc = "Неупокоенная душа"
	icon = 'icons/Events/mob/wraith.dmi'
	icon_state = "wraith_opaque"
	speed = 1
	maxHealth = 35
	health = 35
	melee_damage = 7
	attacktext = "бьет"
	attack_sound = list('sound/Event/wraith.ogg')
	universal_speak = 1
	universal_understand = 1

/mob/living/simple_animal/wraith/atom_init()
	..()
	update_icon()

/mob/living/simple_animal/wraith/update_icon()
	var/image/eye = image(icon, icon_state = "eye")
	eye.plane = ABOVE_LIGHTING_PLANE
	add_overlay(eye)
	..()

/mob/living/simple_animal/wraith/death()
	..()
	qdel(src)

