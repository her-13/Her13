/datum/species/human/hub
	name = HUBMAN
	brute_mod = 0
	burn_mod = 0
	oxy_mod = 0
	tox_mod = 0
	clone_mod = 0
	flags = list(
	 NO_BREATHE = TRUE
	,NO_BLOOD = TRUE
	,NO_DNA = TRUE
	,NO_SCAN = TRUE
	,VIRUS_IMMUNE = TRUE
	,HAS_SKIN_COLOR = TRUE
	,HAS_HAIR_COLOR = TRUE
	,NO_FINGERPRINT = TRUE
	,NO_BLOOD_TRAILS = TRUE
	,NO_PAIN = TRUE
	,RAD_IMMUNE = TRUE
	,NO_EMBED = TRUE
	,NO_MINORCUTS = TRUE
	,NO_EMOTION = TRUE
	,NO_VOMIT = TRUE
	,NO_FAT = TRUE
	)

/datum/species/skeleton/deadman // Тоже самое что Хабовец, но в виде скелета
	name = DEADMAN
	icobase = 'icons/Events/race/skeleton.dmi'
	deform = 'icons/Events/race/skeleton.dmi'
	brute_mod = 0
	burn_mod = 0

/datum/species/human/lepr
	name = LEPR

/datum/species/skeleton/undead
	name = HOMM_SKELETON
	icobase = 'icons/Events/race/skeleton.dmi'
	deform = 'icons/Events/race/skeleton.dmi'
	var/escape_spell = new /obj/effect/proc_holder/spell/aoe_turf/undead_escape

/datum/species/skeleton/undead/on_gain(mob/living/carbon/human/H)
	..()
	H.AddSpell(escape_spell)
	SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "undead", /datum/mood_event/undead)

/datum/species/skeleton/undead/on_loose(mob/living/carbon/human/H)
	..()
	H.RemoveSpell(escape_spell)

/datum/species/skeleton/undead/lich
	name = LICH
	eyes = "zombie_ms_s"
	eyes_glowing = TRUE

/datum/species/skeleton/undead/lich/on_gain(mob/living/carbon/human/H)
	..()
	H.AddSpell(new /obj/effect/proc_holder/spell/in_hand/death_cloud)

/datum/species/skeleton/undead/homm_zombie // Почему от скелета? Чтобы не обьяснять снова про отрубание-присоединение конечностей.
	name = HOMM_ZOMBIE
	icobase = 'icons/Events/race/zombie.dmi'
	deform = 'icons/Events/race/zombie.dmi'
	brute_mod = 1
	burn_mod = 1.5
	speed_mod = -0.2
	flesh_color = "#ffc896"
	blood_datum_path = /datum/dirt_cover/red_blood
	damage_mask = TRUE
	flags = list(
	 NO_BREATHE = TRUE
	,NO_BLOOD = FALSE
	,NO_DNA = TRUE
	,NO_SCAN = TRUE
	,VIRUS_IMMUNE = TRUE
	,NO_FINGERPRINT = TRUE
	,NO_BLOOD_TRAILS = FALSE
	,NO_PAIN = TRUE
	,RAD_IMMUNE = TRUE
	,NO_EMBED = TRUE
	,NO_MINORCUTS = FALSE
	,NO_EMOTION = TRUE
	,NO_VOMIT = TRUE
	,NO_FAT = TRUE
	)

	has_bodypart = list(
		 BP_CHEST  = /obj/item/organ/external/chest/skeleton/homm_zombie
		,BP_GROIN  = /obj/item/organ/external/groin/skeleton/homm_zombie
		,BP_HEAD   = /obj/item/organ/external/head/skeleton/homm_zombie
		,BP_L_ARM  = /obj/item/organ/external/l_arm/skeleton/homm_zombie
		,BP_R_ARM  = /obj/item/organ/external/r_arm/skeleton/homm_zombie
		,BP_L_LEG  = /obj/item/organ/external/l_leg/skeleton/homm_zombie
		,BP_R_LEG  = /obj/item/organ/external/r_leg/skeleton/homm_zombie
		)

/datum/species/skeleton/undead/homm_zombie/handle_post_spawn(mob/living/carbon/human/H)
	H.status_flags &= ~(CANSTUN | CANPARALYSE)
	return

/datum/species/skeleton/undead/homm_zombie/knight
	name = ZOMBIE_KNIGHT
	eyes = "zombie_ms_s"
	eyes_glowing = TRUE
	burn_mod = 1.2

/datum/species/human/angel
	name = ANGEL
	icobase = 'icons/Events/race/angel.dmi'
	deform = 'icons/Events/race/angel.dmi'
	tail = "wings"
	brute_mod = 0.5
	burn_mod = 0.5
	oxy_mod = 0
	tox_mod = 0
	clone_mod = 0
	blood_datum_path = /datum/dirt_cover/oil
	flags = list(
	 IS_WHITELISTED = TRUE
	,HAS_LIPS = TRUE
	,HAS_UNDERWEAR = FALSE
	,HAS_TAIL = TRUE
	,HAS_SKIN_COLOR = TRUE
	,HAS_HAIR_COLOR = TRUE
	,NO_MINORCUTS = TRUE
	,FACEHUGGABLE = TRUE
	,IS_SOCIAL = TRUE
	,NO_VOMIT = TRUE
	,BIOHAZZARD_IMMUNE = TRUE
	,NO_BREATHE = TRUE
	,NO_SCAN = TRUE
	,NO_EMOTION = TRUE
	,NO_PAIN = TRUE
	,NO_FINGERPRINT = TRUE
	)
