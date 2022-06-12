// ЛЕПРЕКОНСКИЕ ТОРГОВЫЕ АВТОМАТЫ
/obj/machinery/vending/lepr
	name = "Торговый Портал Лепреконов"
	desc = "У него есть товар , если у тебя есть монеты."
	icon = 'icons/obj/Events/portal_of_greed.dmi'
	icon_state = "portal"
	anchored = TRUE
	layer = 1
	density = TRUE
	use_power = NO_POWER_USE
	var/serial_number = 1
	var/moneyIn = 0

	products = list(
		/obj/item/stack/money/gold = 1000,
		/obj/item/stack/money/silver = 1000,
		/obj/item/stack/money/bronz = 1000,
		/obj/item/weapon/reagent_containers/food/snacks/soap = 1000,
		/obj/item/uncurs_ointment = 1000,
		/obj/item/stack/medical/advanced/bruise_pack = 1000,
		/obj/item/stack/medical/advanced/ointment = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/peridaxon = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/kyphotorin = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/adminordrazine = 1000,
		/obj/vehicle/space/spacebike/horse = 1000,
	)

	prices = list(
	/obj/item/stack/money/gold = 100,
	/obj/item/stack/money/silver = 10,
	/obj/item/stack/money/bronz = 1,
	/obj/item/weapon/reagent_containers/food/snacks/soap = 5,
	/obj/item/uncurs_ointment = 1000,
	/obj/item/stack/medical/advanced/bruise_pack = 250,
	/obj/item/stack/medical/advanced/ointment = 250,
	/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 50,
	/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 100,
	/obj/item/weapon/reagent_containers/glass/bottle/peridaxon = 500,
	/obj/item/weapon/reagent_containers/glass/bottle/kyphotorin = 750,
	/obj/item/weapon/reagent_containers/glass/bottle/adminordrazine = 2000,
	/obj/vehicle/space/spacebike/horse = 750,


	)


/obj/machinery/vending/lepr/ui_interact(mob/user)
	if(tree_of_greed_approval || istype(src, /obj/machinery/vending/lepr/ILB))
		..()
	else
		to_chat(user, "<span class='warning'>ДРЕВО МУДРОСТИ ОТКЛЮЧИЛО ЭТОТ АВТОМАТ ОТ БАНКОВСКОЙ СИСТЕМЫ!</span>")

/obj/machinery/vending/lepr/atom_init()
	. = ..()
	lepr_vends_list += src // global list
	serial_number = "MoneyScammer-[rand(1, 1000)]"
	cameranet.cameras += src
	cameranet.addCamera(src)
	cameranet.updateVisibility(src, 0)

/obj/machinery/vending/lepr/Destroy()
	. = ..()
	cameranet.cameras -= src
	cameranet.removeCamera(src)


/obj/machinery/vending/lepr/attackby(obj/item/W, mob/user)
	if(tree_of_greed_approval || istype(src, /obj/machinery/vending/lepr/ILB))
		..()
	else
		to_chat(user, "<span class='warning'>ДРЕВО МУДРОСТИ ОТКЛЮЧИЛО ЭТОТ АВТОМАТ ОТ БАНКОВСКОЙ СИСТЕМЫ!</span>")

/obj/machinery/vending/lepr/ILB
	name = "Торговый портал Всемирного Леприконского Банка"
	desc = "Для своих у ВЛБ таки кошерные скидки"
	icon = 'icons/obj/Events/portal_of_greed.dmi'
	icon_state = "portal"
	anchored = TRUE
	layer = 1
	density = TRUE
	use_power = NO_POWER_USE

	products = list(
		/obj/item/lootbox = 1000,
		/obj/item/stack/money/gold = 1000,
		/obj/item/stack/money/silver = 1000,
		/obj/item/stack/money/bronz = 1000,
		/obj/item/weapon/reagent_containers/food/snacks/soap = 1000,
		/obj/item/uncurs_ointment = 1000,
		/obj/item/stack/medical/advanced/bruise_pack = 1000,
		/obj/item/stack/medical/advanced/ointment = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/peridaxon = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/kyphotorin = 1000,
		/obj/item/weapon/reagent_containers/glass/bottle/adminordrazine = 1000,
	)

	prices = list(
	/obj/item/lootbox = 1,
	/obj/item/stack/money/gold = 100,
	/obj/item/stack/money/silver = 10,
	/obj/item/stack/money/bronz = 1,
	/obj/item/weapon/reagent_containers/food/snacks/soap = 1,
	/obj/item/uncurs_ointment = 599,
	/obj/item/stack/medical/advanced/bruise_pack = 150,
	/obj/item/stack/medical/advanced/ointment = 150,
	/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 25,
	/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 50,
	/obj/item/weapon/reagent_containers/glass/bottle/peridaxon = 250,
	/obj/item/weapon/reagent_containers/glass/bottle/kyphotorin = 500,
	/obj/item/weapon/reagent_containers/glass/bottle/adminordrazine = 100,
	)


/obj/machinery/vending/lepr/examine(mob/user)
	..()
	to_chat(user, "Содержит [moneyIn] единиц валюты")
	if(!tree_of_greed_approval)
		to_chat(user, "<span class='warning'>ДРЕВО МУДРОСТИ ОТКЛЮЧИЛО ЭТОТ АВТОМАТ ОТ БАНКОВСКОЙ СИСТЕМЫ!</span>")


/obj/machinery/vending/lepr/attackby(obj/item/W, mob/user)
	..()
	if(istype(W, /obj/item/stack/money))
		var/obj/item/stack/money/M = W
		if(M.amount < 0)
			to_chat(usr, "<span class='notice'>Денег больше нет...</span>")
			return
		M.amount -= 1
		if(M.denomination <= 0)
			for(var/obj/item/clover/lucky/CL in user.contents)
				if(istype(CL, /obj/item/clover/lucky))
					if(prob(50))
						M.denomination =-M.denomination
						to_chat(user, "<span class='warning'>Ваша сказочная удача, позволила вам обмануть портал.</span>")
						new /obj/effect/effect/luck(get_turf(user))
					else
						to_chat(user, "<span class='warning'>Всемирный Леприконский Банк опознал вашу фальшивую монету. Ну и ну! На этот портал наложен штраф. Слава ВЛБ.</span>")
				else
					to_chat(user, "<span class='warning'>Всемирный Леприконский Банк опознал вашу фальшивую монету. Ну и ну! На этот портал наложен штраф. Слава ВЛБ.</span>")
		moneyIn += M.denomination
		to_chat(user, "<span class='notice'>[M] отправлен в [src]</span>")
		playsound(usr, 'sound/effects/coin_ins.ogg',VOL_EFFECTS_MASTER)
		M.update_icon()
		return


/obj/machinery/vending/lepr/proc/check_money(datum/data/vending_product/R,mob/user)
	if(R.price > moneyIn)
		to_chat(usr, "<span class='warning'>Не хватает денег.</span>")
		updateUsrDialog()
		return
	else
		vend(src.currently_vending, usr)
		currently_vending = null
		moneyIn -= R.price
		updateUsrDialog()

/obj/machinery/vending/lepr/ui_interact(mob/user)
	..()
	if(currently_vending)
		check_money(currently_vending,user)
		currently_vending = null
		return

/obj/structure/knight_statue
	name = "Статуя"
	desc = "Интересно , кто это?"
	icon = 'icons/Events/structure/statue_knight.dmi'
	icon_state = "statue"
	can_buckle = TRUE
	anchored = TRUE
	density = 1
	layer = 11


/obj/structure/pillory
	name = "Позорный столб"
	desc = "Какой позор.."
	can_buckle = TRUE
	icon = 'icons/obj/structures/scrap/bonfire.dmi'
	icon_state = "bonfire_rod"
	anchored = TRUE
	layer = 1
	pixel_y = 16
	buckle_require_restraints = TRUE

/obj/structure/pillory/post_buckle_mob(mob/user)
	update_mob(user,1)

/obj/structure/pillory/proc/update_mob(mob/M, buckling = 0)
	if(M == buckled_mob)
		var/new_pixel_x = 0
		var/new_pixel_y = 14
		if(buckling)
			animate(M, pixel_x = new_pixel_x, pixel_y = new_pixel_y, 2, 1, LINEAR_EASING)
		else
			M.pixel_x = new_pixel_x
			M.pixel_y = new_pixel_y
	else
		animate(M, pixel_x = 0, pixel_y = 0, 2, 1, LINEAR_EASING)

//ДВЕРИ
/obj/structure/mineral_door/wood/peasant
	name = "Дверь Крестьянина"
	req_one_access = list(access_peasant)

/obj/structure/mineral_door/metal/barraks
	name = "Дверь Барраков"
	req_access = list(access_knight)

/obj/structure/mineral_door/wood/mon
	name = "Дверь Монастыря"
	req_one_access = list(access_helper)

/obj/structure/mineral_door/wood/doctor
	name = "Дверь Больницы"
	req_one_access = list(access_plague)

/obj/structure/mineral_door/wood/inn
	name = "Дверь Трактира"
	req_one_access = list(access_innkeeper)

/obj/structure/mineral_door/wood/headman
	name = "Дверь Старосты"
	req_one_access = list(access_headman)

/obj/structure/mineral_door/metal/headman
	name = "Оружейная"
	req_access = list(access_headman)

/obj/structure/mineral_door/wood/inn1
	name = "Комната 1"
	req_access = list(access_innkeeper,access_inn1)

/obj/structure/mineral_door/wood/inn2
	name = "Комната 2"
	req_access = list(access_innkeeper,access_inn2)

/obj/structure/mineral_door/wood/inn3
	name = "Комната 3"
	req_access = list(access_innkeeper,access_inn3)

/obj/structure/mineral_door/wood/monk
	name = "Дверь Монаха"
	req_one_access = list(access_monk)

/obj/structure/mineral_door/wood/hero
	name = "Дверь Лорда"
	req_one_access = list(access_hero)


//Гробы для Некрополиса
/obj/structure/coffin
	name = "Простой гроб"
	desc = "Человек в этом гробу, явно ничем особым не выделялся"
	icon = 'icons/Events/structure/coffin.dmi'
	icon_state = "coffin"
	anchored = TRUE
	layer = 1
	density = TRUE
	var/isSingleUse = 0
	var/obj/structure/hell_spawner/coffin/typeOfCorpse = /obj/structure/hell_spawner/coffin
	var/tar
	var/icon/open_state = "coffin_open"

/obj/structure/coffin/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/lich_staff)&&!isSingleUse)
		var/obj/item/lich_staff/L = I
		if(L.owner == null)
			to_chat(user, "<span class='warning'><b>Сначала привяжите посох к себе.</b></span>")
			return
		if(user.mind != L.owner)
			to_chat(user, "<span class='warning'>[I.name] не будет подчиняться вам</span>")
			return
		tar = pick(get_area_turfs(get_area_by_type(/area/custom/valhalla)))
		typeOfCorpse = new typeOfCorpse(tar)
		typeOfCorpse.myCoffin =  src
		typeOfCorpse.myMaster = user
		typeOfCorpse.target = src.loc
		isSingleUse = 1
		to_chat(user, "<span class='warning'> Тело осквернено. Осталось подождать пока душа вернеться из загробного мира</span>")
