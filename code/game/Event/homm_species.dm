/datum/species/human/hub
	name = HUBMAN
	brute_mod = 0
	burn_mod = 0
	oxy_mod = 0
	tox_mod = 0
	clone_mod = 0

/datum/species/skeleton/deadman // Тоже самое что Хабовец, но в виде скелета
	name = DEADMAN
	brute_mod = 0
	burn_mod = 0

/datum/species/human/lepr
	name = LEPR

/datum/species/human/lepr/on_gain(mob/living/carbon/human/H)
	. = ..()
	H.mutations.Add(SMALLSIZE)
	H.regenerate_icons()

	H.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/lepr_escape)
	H.AddSpell(new /obj/effect/proc_holder/spell/targeted/lepr_hivemind)

	H.see_invisible = 34 // so he can see the tree of greed

/datum/species/human/lepr/on_loose(mob/living/carbon/human/H, new_species)
	H.mutations.Remove(SMALLSIZE)
	H.regenerate_icons()

	var/obj/effect/proc_holder/spell/aoe_turf/lepr_escape/LE = locate() in H.spell_list
	var/obj/effect/proc_holder/spell/targeted/lepr_hivemind/LH = locate() in H.spell_list
	H.RemoveSpell(LE)
	H.RemoveSpell(LH)

	H.see_invisible = SEE_INVISIBLE_LIVING

	cameranet.cameras += H
	cameranet.addCamera(H)
	cameranet.updateVisibility(H, 0)

	return ..()
