/obj/item/stack/money
	var/denomination = 0
	w_class = SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	attack_verb = list("hit", "bludgeoned", "whacked")

/obj/item/stack/money/gold
	name = "Золотой Эрафубль"
	desc = "Золотишко"
	singular_name = "Золотых Эрафублей"
	icon = 'icons/obj/Events/gold-coin.dmi'
	icon_state = "coin"
	denomination = 100


/obj/item/stack/money/New()
	..()
	update_icon()

/obj/item/stack/money/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.



/obj/item/stack/money/use()
	. = ..()
	update_icon()

/obj/item/stack/money/add()
	. = ..()
	update_icon()

/obj/item/stack/money/silver
	name = "Серебряный Эрафубль"
	desc = "Из серебра"
	singular_name = "Серебрянных Эрафублей"
	icon = 'icons/obj/Events/silver-coin.dmi'
	icon_state = "coin"
	denomination = 10


/obj/item/stack/money/bronz
	name = "Бронзовый Эрафубль"
	desc = "Отлито из говна"
	singular_name = "Бронзовых Эрафублей"
	icon = 'icons/obj/Events/bronz-coin.dmi'
	icon_state = "coin"
	denomination = 1

/obj/item/stack/money/goldfake
	name = "Золотой Эрафубль?"
	desc = "Золотишко"
	singular_name = "Золотых Эрафублей?"
	icon = 'icons/obj/Events/gold-coin.dmi'
	icon_state = "coin"

/obj/item/stack/money/goldfake/atom_init_late()
	..()
	denomination = rand(-100 , 100)

/obj/item/stack/money/silverfake
	name = "Серебряный Эрафубль?"
	desc = "Из серебра"
	singular_name = "Серебрянных Эрафублей?"
	icon = 'icons/obj/Events/silver-coin.dmi'
	icon_state = "coin"

/obj/item/stack/money/silverfake/atom_init_late()
	..()
	denomination = rand(-10 , 10)
