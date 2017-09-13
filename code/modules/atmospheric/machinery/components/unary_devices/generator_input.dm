/obj/machinery/atmospherics/components/unary/generator_input
	icon = 'icons/obj/atmospherics/heat_exchanger.dmi'
	icon_state = "intact"
	density = TRUE

	name = "Generator Input"
	desc = "Placeholder."

	var/update_cycle

/obj/machinery/atmospherics/components/unary/generator_input/update_icon()
	if(NODE1)
		icon_state = "intact"
	else
		icon_state = "exposed"

	return

/obj/machinery/atmospherics/components/unary/generator_input/proc/return_exchange_air()
	return AIR1
