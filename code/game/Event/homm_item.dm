//УНИФОРМЫ
/obj/item/clothing/under/peasant
	name = "Одежда Селюка"
	desc = "Дырка на жопе. И не только на жопе. И не только дырка"
	icon_custom = 'icons/Events/clothes/peasant.dmi'
	icon = 'icons/Events/clothes/peasant.dmi'
	icon_state = "peasant"

/obj/item/clothing/under/peasant_fem
	name = "Одежда Селюка"
	desc = "Дырка на жопе. И не только на жопе. И не только дырка"
	icon_custom = 'icons/Events/clothes/peasant_fem.dmi'
	icon = 'icons/Events/clothes/peasant_fem.dmi'
	icon_state = "peasant_fem"

/obj/item/clothing/under/smith
	name = "Одежда Кузнеца"
	desc = "Жестко воняет потом"
	icon_custom = 'icons/Events/clothes/smith.dmi'
	icon = 'icons/Events/clothes/smith.dmi'
	icon_state = "smith"

/obj/item/clothing/under/innkeeper
	name = "Одежда Трактирщика"
	desc = "Веет уютом"
	icon_custom = 'icons/Events/clothes/inn.dmi'
	icon = 'icons/Events/clothes/inn.dmi'
	icon_state = "inn"

/obj/item/clothing/under/knight
	name = "Одежда Рыцаря"
	desc = ""
	icon_custom = 'icons/Events/clothes/knight.dmi'
	icon = 'icons/Events/clothes/knight.dmi'
	icon_state = "knightunder"

/obj/item/clothing/under/lepr
	name = "Форма Жадности"
	desc = "2/3 бюджета всей Эрафии , в этом костюме"
	icon_custom = 'icons/Events/clothes/lepr.dmi'
	icon = 'icons/Events/clothes/lepr.dmi'
	icon_state = "lepr"

/obj/item/clothing/under/lich
	name = "Одеяние Лича"
	desc = "Изящно висит на голых костях"
	icon_custom = 'icons/Events/clothes/lich.dmi'
	icon = 'icons/Events/clothes/lich.dmi'
	icon_state = "lich"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)

/obj/item/clothing/under/zombie_pants
	name = "Штаны"
	desc = "Живые крестьяне думают, что ничего дырявее их портков не существуют. Мертвые крестьяне понимают что они ошибались."
	icon_custom = 'icons/Events/clothes/zombie_pants.dmi'
	icon = 'icons/Events/clothes/zombie_pants.dmi'
	icon_state = "pants"


// СУИТЫ

/obj/item/clothing/suit/monk_helper
	name = "Роба"
	desc = "Роба помощника монаха"
	icon_custom = 'icons/Events/clothes/suit/helper.dmi'
	icon = 'icons/Events/clothes/suit/helper.dmi'
	icon_state = "monk_helper"

/obj/item/clothing/suit/headman
	name = "Пальто Старосты"
	desc = "Самая приличная одежда на несколько десятков километров"
	icon_custom = 'icons/Events/clothes/suit/headman.dmi'
	icon = 'icons/Events/clothes/suit/headman.dmi'
	icon_state = "headman_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/wizrobe/monk
	name = "Пси-Роба"
	desc = "Святая!"
	icon_custom = 'icons/Events/clothes/suit/monk.dmi'
	icon = 'icons/Events/clothes/suit/monk.dmi'
	icon_state = "monk"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)

/obj/item/clothing/suit/armor/milita
	name = "Доспех Ополчения"
	desc = "Не такой крепкий как у рыцарей, но зато твой."
	icon_custom = 'icons/Events/clothes/suit/milita.dmi'
	icon = 'icons/Events/clothes/suit/milita.dmi'
	icon_state = "milita_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	pierce_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 30, bullet = 10, laser = 25, energy = 20, bomb = 35, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/knight
	name = "Рыцарские доспехи"
	desc = "Сине-белые. Цвета надела,к которому вы приставлены"
	icon_custom = 'icons/Events/clothes/suit/knight.dmi'
	icon = 'icons/Events/clothes/suit/knight.dmi'
	icon_state = "crusader"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	pierce_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 25, bio = 0, rad = 10)
	siemens_coefficient = 1.2

/obj/item/clothing/suit/armor/death_knight
	name = "Черные доспехи"
	desc = "Совсем не отражает свет"
	icon_custom = 'icons/Events/clothes/suit/death_knight.dmi'
	icon = 'icons/Events/clothes/suit/death_knight.dmi'
	icon_state = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	pierce_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 25, bio = 0, rad = 10)
	siemens_coefficient = 1.2


//ШЛЯПЫ
/obj/item/clothing/head/monk_helper
	name = "Простой капюшон"
	desc = "Отстегивающийся капюшон в средневековье! Очень прогрессивно"
	flags = HEADCOVERSEYES | BLOCKHAIR
	icon_custom = 'icons/Events/clothes/hats/helper.dmi'
	icon = 'icons/Events/clothes/hats/helper.dmi'
	icon_state = "monk_helper"

/obj/item/clothing/head/lepr
	name = "Шляпа Жадности"
	desc = "+2 к Удаче"
	icon_custom = 'icons/Events/clothes/hats/lepr.dmi'
	icon = 'icons/Events/clothes/hats/lepr.dmi'
	icon_state = "lepr"

/obj/item/clothing/head/headman
	name = "Шапка Старосты"
	desc = "Вау, вот это шляпа"
	icon_custom = 'icons/Events/clothes/hats/headman.dmi'
	icon = 'icons/Events/clothes/hats/headman.dmi'
	icon_state = "headman_hat"

/obj/item/clothing/head/inn
	name = "Бандана Трактирщика"
	desc = "На случай если вам не нравится лысина"
	icon_custom = 'icons/Events/clothes/hats/inn.dmi'
	icon = 'icons/Events/clothes/hats/inn.dmi'
	icon_state = "inn_hat"

/obj/item/clothing/head/lich
	name = "Корона Лича"
	desc = "Тяга к роскоши остается даже после смерти"
	icon_custom = 'icons/Events/clothes/hats/lich.dmi'
	icon = 'icons/Events/clothes/hats/lich.dmi'
	icon_state = "lich"
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)


/obj/item/clothing/head/wizard/monk
	name = "Пси-Роба"
	desc = "Святая!"
	icon_custom = 'icons/Events/clothes/hats/monk.dmi'
	icon = 'icons/Events/clothes/hats/monk.dmi'
	icon_state = "monk"
	flags = HEADCOVERSEYES | BLOCKHAIR
	armor = list(melee = 40, bullet = 40, laser = 40,energy = 40, bomb = 40, bio = 40, rad = 40)

/obj/item/clothing/head/helmet/milita
	name = "Шлем Ополчения"
	desc = "Солидная защита для головы."
	icon_custom = 'icons/Events/clothes/hats/milita.dmi'
	icon = 'icons/Events/clothes/hats/milita.dmi'
	righthand_file = 'icons/Events/clothes/hats/milita.dmi'
	lefthand_file  = 'icons/Events/clothes/hats/milita.dmi'
	icon_state = "milita"
	item_state = "milita"
	flags = HEADCOVERSEYES
	armor = list(melee = 30, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.3

/obj/item/clothing/head/helmet/lord
	name = "Корона"
	desc = "Кто тут главный?"
	icon_custom = 'icons/Events/clothes/hats/lord.dmi'
	icon = 'icons/Events/clothes/hats/lord.dmi'
	icon_state = "lord_hat"
	item_state = "lord_hat"
	flags = HEADCOVERSEYES
	armor = list(melee = 50, bullet = 50, laser = 50,energy = 50, bomb = 50, bio = 50, rad = 50)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.3

/obj/item/clothing/head/helmet/death_knight
	name = "Черный Шлем"
	desc = "Стильные рога"
	icon_custom = 'icons/Events/clothes/hats/death_knight.dmi'
	icon = 'icons/Events/clothes/hats/death_knight.dmi'
	icon_state = "helmet"
	item_state = "helmet"
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 10)
	siemens_coefficient = 1.2
	flags = HEADCOVERSEYES|HEADCOVERSMOUTH|BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES

//БОТИНКИ
/obj/item/clothing/shoes/lepr
	name = "Ботинки Жадности"
	desc = "С потайными местами для заначек"
	icon_custom = 'icons/Events/clothes/shoes/lepr.dmi'
	icon = 'icons/Events/clothes/shoes/lepr.dmi'
	icon_state = "lepr"

//МАСКИ
/obj/item/clothing/mask/milita
	name = "Горжет"
	desc = "Сразу видно - ополченец."
	icon_custom = 'icons/Events/clothes/mask/milita.dmi'
	icon = 'icons/Events/clothes/mask/milita.dmi'
	icon_state = "milita"

/obj/item/clothing/mask/lord
	name = "Плащ Лорда"
	desc = "Символ вашего статуса"
	icon_custom = 'icons/Events/clothes/mask/lord.dmi'
	icon = 'icons/Events/clothes/mask/lord.dmi'
	icon_state = "lord"

//Инструмены и все похожее

/obj/item/lich_staff
	name = "Посох Лича"
	desc = "Дает власть над смертью"
	icon_custom = 'icons/Events/item/lich_staff.dmi'
	icon = 'icons/Events/item/lich_staff.dmi'
	righthand_file = 'icons/Events/item/lich_staff.dmi'
	lefthand_file  = 'icons/Events/item/lich_staff.dmi'
	icon_state = "lich_staff"
	item_state = "lich_staff"
	force = 15
	var/datum/mind/owner

/obj/item/lich_staff/attack_self(mob/user)
	if(!owner)
		to_chat(user, "<span class='notice'>Вы привязали посох к себе.</span>")
		owner = user.mind
		return
	if(user.mind != owner)
		to_chat(user, "<span class='warning'>[name] не будет подчиняться вам</span>")
		return

/obj/item/lich_staff/attack(mob/living/carbon/human/H, mob/user)
	if(owner == null)
		to_chat(user, "<span class='warning'><b>Сначала привяжите посох к себе.</b></span>")
		return
	if(user.mind != owner)
		to_chat(user, "<span class='warning'>[name] не будет подчиняться вам</span>")
		return
	if(!ishuman(H))//If target is not a human.
		return ..()
	if(H.species.name == HOMM_SKELETON || H.species.name == LICH ||H.species.name == HOMM_ZOMBIE || H.species.name == ZOMBIE_KNIGHT)
		to_chat(H, "<span class='warning'>Это существо уже живой мертвец</span>")
		return
	if(H.stat == CONSCIOUS)
		to_chat(user, "<span class='warning'><b>Зомбирование не удалось!</b></span> Сначала доведите состояние жертвы до критической отметки.")
		return
	if(H.client == null)
		to_chat(user, "<span class='warning'><b>Зомбирование не удалось!</b></span> В этой оболочке нет души.")
		return
	H.set_species(HOMM_ZOMBIE)
	to_chat(H, "<span class='warning'>Теперь ты живой мертвец.[user] твой мастер. Служи и выполняй все приказы мастера.</span>")

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
		to_chat(user, "<span class='notice'> Здесь написано: <span class='emojify'>[targName]</span>.</span>")
		return

/obj/item/skeleton_sword
	name = "Старый меч"
	icon_custom = 'icons/Events/item/skeleton_sword.dmi'
	icon = 'icons/Events/item/skeleton_sword.dmi'
	righthand_file = 'icons/Events/item/skeleton_sword.dmi'
	lefthand_file  = 'icons/Events/item/skeleton_sword.dmi'
	icon_state = "sword"
	slot_flags = SLOT_FLAGS_BELT
	force = 15

/obj/item/skeleton_sword/attack(mob/living/carbon/M, mob/living/carbon/user)
	playsound(src, pick('sound/Event/sword.ogg','sound/Event/sword1.ogg','sound/Event/sword2.ogg'), VOL_EFFECTS_MASTER)

	return ..()

/obj/item/weapon/melee/whip
	name = "Плетка"
	desc = "Для серьезных преступлений"
	icon_custom = 'icons/Events/item/whip.dmi'
	icon = 'icons/Events/item/whip.dmi'
	righthand_file = 'icons/Events/item/whip.dmi'
	lefthand_file  = 'icons/Events/item/whip.dmi'
	icon_state = "whip"
	flags = CONDUCT
	slot_flags = SLOT_FLAGS_BELT
	force = 1
	hitsound = list('sound/weapons/captainwhip.ogg')
	throwforce = 1
	w_class = SIZE_SMALL
	origin_tech = "combat=4"
	attack_verb = list("выпорол")

/obj/item/weapon/pen/feather
	name = "Письменное перо"
	desc = "Вырвано у чернильного гуся, совсем не нужно заправлять."
	icon_custom = 'icons/Events/item/pen.dmi'
	icon = 'icons/Events/item/pen.dmi'
	righthand_file = 'icons/Events/item/pen.dmi'
	lefthand_file  = 'icons/Events/item/pen.dmi'
	icon_state = "pen"
	colour = "black"

/obj/item/weapon/paper/scroll
	name = "Бумага"
	icon_custom = 'icons/Events/item/paper.dmi'
	icon = 'icons/Events/item/paper.dmi'
	righthand_file = 'icons/Events/item/paper.dmi'
	lefthand_file  = 'icons/Events/item/paper.dmi'
	icon_state = "paper"

/obj/item/weapon/paper/scroll/update_icon()
	if(info)
		icon_state = "paper_f"
		return
	icon_state = "paper"

// КЛЮЧИ
/obj/item/weapon/card/id/key
	desc = "Ключик"
/obj/item/weapon/card/id/key/peasant
	name = "Ключ Крестьянина"
	access = list(access_peasant)
	icon_state = "peasantkey"
/obj/item/weapon/card/id/key/helper
	name = "Ключ Послушника"
	access = list(access_helper)
	icon_state = "peasantkey"
/obj/item/weapon/card/id/key/doctor
	name = "Ключ Доктора"
	access = list(access_plague,access_peasant)
	icon_state = "peasantkey"
/obj/item/weapon/card/id/key/headman
	name = "Ключ Старосты"
	access = list(access_peasant,access_headman,access_knight,access_plague,access_innkeeper,access_inn1,access_inn2,access_inn3)
	icon_state = "peasantkey"
/obj/item/weapon/card/id/key/innkeeper
	name = "Ключ Трактирщика"
	access = list(access_peasant,access_innkeeper,access_inn1,access_inn2,access_inn3)
	icon_state = "innkeeperkey"
/obj/item/weapon/card/id/key/innkeeper1
	name = "Ключ 1 Комнаты"
	access = list(access_innkeeper,access_inn1)
	icon_state = "innkeeperkey"
/obj/item/weapon/card/id/key/innkeeper2
	name = "Ключ 2 Комнаты"
	access = list(access_innkeeper,access_inn2)
	icon_state = "innkeeperkey"
/obj/item/weapon/card/id/key/innkeeper3
	name = "Ключ 3 Комнаты"
	access = list(access_innkeeper,access_inn3)
	icon_state = "innkeeperkey"
/obj/item/weapon/card/id/key/monk
	name = "Ключ Монаха"
	access = list(access_monk,access_helper)
	icon_state = "monkkey"
/obj/item/weapon/card/id/key/knight
	name = "Ключ Рыцаря"
	access = list(access_knight)
	icon_state = "knightkey"
/obj/item/weapon/card/id/key/hhero
	name = "Ключ Лорда"
	access = list(access_hero,access_peasant,access_knight,access_headman,access_plague,access_innkeeper,access_inn1,access_inn2,access_inn3)
	icon_state = "herokey"

/obj/item/weapon/card/id/key/atom_init()
	. = ..()
	if(ismob(loc)) // Runtime prevention on laggy starts or where users log out because of lag at round start.
		var/mob/user = loc
		registered_name = ishuman(user) ? user.real_name : user.name
	else
		registered_name = "Ключик"
	name = "[name] [registered_name]"
