//УНИФОРМЫ
/obj/item/clothing/under/peasant
	name = "Одежда Селюка"
	desc = "Дырка на жопе. И не только на жопе. И не только дырка"
	icon_state = "peasant"
	item_state = "peasant"

/obj/item/clothing/under/peasant_fem
	name = "Одежда Селюка"
	desc = "Дырка на жопе. И не только на жопе. И не только дырка"
	icon_state = "peasant_fem"
	item_state = "peasant_fem"

/obj/item/clothing/under/smith
	name = "Одежда Кузнеца"
	desc = "Веет уютом"
	icon_state = "smith"
	item_state = "smith"

/obj/item/clothing/under/innkeeper
	name = "Одежда Трактирщика"
	desc = "Веет уютом"
	icon_state = "inn"
	item_state = "inn"

/obj/item/clothing/under/lepr
	name = "Форма Жадности"
	desc = "2/3 бюджета всей Эрафии , в этом костюме"
	icon_state = "lepr"
	item_state = "lepr"

// СУИТЫ

/obj/item/clothing/suit/monk_helper
	name = "Роба"
	desc = "Роба помощника монаха"
	icon_state = "monk_helper"
	item_state = "monk_helper"

/obj/item/clothing/suit/headman
	name = "Пальто Старосты"
	desc = "Самая приличная одежда на несколько десятков километров"
	icon_state = "headman_coat"
	item_state = "headman_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/wizrobe/monk
	name = "Пси-Роба"
	desc = "Святая!"
	icon_state = "monk"
	item_state = "monk"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)

/obj/item/clothing/suit/armor/milita
	name = "Доспех Ополчения"
	desc = "Не такой крепкий как у рыцарей, но зато твой."
	icon_state = "milita_armor"
	item_state = "milita_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	pierce_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 30, bullet = 10, laser = 25, energy = 20, bomb = 35, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT


//ШЛЯПЫ
/obj/item/clothing/head/monk_helper
	name = "Простой капюшон"
	desc = "Отстегивающийся капюшон в средневековье! Очень прогрессивно"
	flags = HEADCOVERSEYES | BLOCKHAIR
	icon_state = "monk_helper"
	item_state = "monk_helper"

/obj/item/clothing/head/lepr
	name = "Шляпа Жадности"
	desc = "+2 к Удаче"
	icon_state = "lepr"
	item_state = "lepr"


/obj/item/clothing/head/headman
	name = "Шапка Старосты"
	desc = "Вау, вот это шляпа"
	icon_state = "headman_hat"
	item_state = "headman_hat"


/obj/item/clothing/head/inn
	name = "Бандана Трактирщика"
	desc = "На случай если вам не нравится лысина"
	icon_state = "inn_hat"
	item_state = "inn_hat"

/obj/item/clothing/head/wizard/monk
	name = "Пси-Роба"
	desc = "Святая!"
	icon_state = "monk"
	item_state = "monk"
	flags = HEADCOVERSEYES | BLOCKHAIR
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)

/obj/item/clothing/head/helmet/milita
	name = "Шлем Ополчения"
	desc = "Солидная защита для головы."
	icon_state = "milita"
	item_state = "milita"
	flags = HEADCOVERSEYES
	armor = list(melee = 30, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.3

//БОТИНКИ
/obj/item/clothing/shoes/lepr
	name = "Ботинки Жадности"
	desc = "С потайными местами для заначек"
	icon_state = "lepr"

//МАСКИ
/obj/item/clothing/mask/milita
	name = "Горжет"
	desc = "Сразу видно - ополченец."
	icon_state = "milita"
	item_state = "milita"

/obj/item/clothing/mask/lord
	name = "Плащ Лорда"
	desc = "Знак вашего статуса"
	icon_state = "lord"
	item_state = "lord"

//Инструмены и все похожее
/obj/item/pillory_tablet
	name = "Преступление"
	icon = 'icons/obj/structures/scrap/bonfire.dmi'
	icon_state = "tablet"
	pixel_y = 14
	layer = 11

/obj/item/pillory_tablet/text
	icon = 'icons/obj/structures/scrap/bonfire.dmi'
	icon_state = "tablet"
	name = "Преступление"
	desc = "..."
	pixel_y = 14
	layer = 11

/obj/item/pillory_tablet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/pen))
		var/defaultText = ""
		var/targName = sanitize(input(usr, "Напишите преступление этого человека", "Transparant text", input_default(defaultText)))
		var/obj/item/pillory_tablet/text/W = new /obj/item/pillory_tablet/text
		W.desc = targName
		user.remove_from_mob(src)
		user.put_in_hands(W)
		qdel(src)
		to_chat(user, "<span class='notice'> Здесь написано: <span class='emojify'>[targName]</span>.")
		return

/obj/item/weapon/melee/whip
	name = "Плетка"
	desc = "Для серьезных преступлений"
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_FLAGS_BELT
	force = 1
	hitsound = list('sound/weapons/captainwhip.ogg')
	throwforce = 1
	w_class = SIZE_SMALL
	origin_tech = "combat=4"
	attack_verb = list("выпорол")

