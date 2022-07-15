//Списки
var/global/list/live_species = list(HUMAN, LEPR) //Расы максимально похожие на стандартных людей. Т.e выдавать этому списку стандартный список причесок / голоса и т.д
var/global/list/undead_species = list(HOMM_SKELETON,LICH,HOMM_ZOMBIE,ZOMBIE_KNIGHT) // Мертвые.

//Списки

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
	var/lepr_escp = new /obj/effect/proc_holder/spell/aoe_turf/lepr_escape
	var/lepr_hive = new /obj/effect/proc_holder/spell/targeted/lepr_hivemind

/datum/species/human/lepr/on_gain(mob/living/carbon/human/H)
	..()
	H.AddSpell(lepr_escp)
	H.AddSpell(lepr_hive)

/datum/species/human/lepr/on_loose(mob/living/carbon/human/H)
	..()
	H.RemoveSpell(lepr_escp)
	H.RemoveSpell(lepr_hive)

/datum/species/skeleton/undead
	name = HOMM_SKELETON
	brute_mod = 1.5
	icobase = 'icons/Events/race/skeleton.dmi'
	deform = 'icons/Events/race/skeleton.dmi'
	var/escape_spell = new /obj/effect/proc_holder/spell/aoe_turf/undead_escape
	dietflags = DIET_MAGIC

/datum/species/skeleton/undead/call_digest_proc(mob/living/M, datum/reagent/R)
	return R.on_undead_digest(M)

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
	var/lich_spell = new /obj/effect/proc_holder/spell/in_hand/death_cloud

/datum/species/skeleton/undead/lich/on_gain(mob/living/carbon/human/H)
	..()
	H.AddSpell(lich_spell)

/datum/species/skeleton/undead/lich/on_loose(mob/living/carbon/human/H)
	..()
	H.RemoveSpell(lich_spell)


/datum/species/skeleton/undead/homm_zombie
	name = HOMM_ZOMBIE
	icobase = 'icons/Events/race/zombie.dmi'
	deform = 'icons/Events/race/zombie.dmi'
	brute_mod = 1
	burn_mod = 1.5
	speed_mod = 3
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
	,NO_FAT = TRUE
	)
	var/flying = new /obj/effect/proc_holder/spell/targeted/flying

/datum/species/human/angel/on_gain(mob/living/carbon/human/H)
	..()
	H.AddSpell(flying)

/datum/species/human/angel/on_loose(mob/living/carbon/human/H)
	..()
	H.RemoveSpell(flying)

/datum/species/human/valera
	name = VALERA
	icobase = 'icons/Events/race/valera.dmi'
	deform = 'icons/Events/race/valera.dmi'
	total_health = 200
	brute_mod = 0.8
	burn_mod = 0.8
	tox_mod = 0.8
	blood_datum_path = /datum/dirt_cover/red_blood
	restricted_inventory_slots = list(SLOT_HEAD, SLOT_WEAR_SUIT)
	flags = list(
	,HAS_LIPS = TRUE
	,HAS_UNDERWEAR = FALSE
	,HAS_TAIL = FALSE
	,HAS_SKIN_COLOR = TRUE
	,HAS_HAIR = FALSE
	,HAS_HAIR_COLOR = FALSE
	,NO_MINORCUTS = FALSE
	,FACEHUGGABLE = TRUE
	,IS_SOCIAL = TRUE
	,NO_VOMIT = FALSE
	,BIOHAZZARD_IMMUNE = FALSE
	,NO_BREATHE = FALSE
	,NO_SCAN = TRUE
	,NO_EMOTION = FALSE
	,NO_PAIN = FALSE
	,NO_FINGERPRINT = TRUE
	,NO_FAT = TRUE
	)
	var/regen_mod = 1
	var/regen_limbs = TRUE

/datum/species/human/valera/regen(mob/living/carbon/human/H)
	for(var/obj/item/organ/internal/O in H.organs)
		if(O.damage)
			O.damage -= 5
			H.nutrition -= 1
			return

	if(H.nutrition > 150 && regen_limbs)
		if(!H.regenerating_bodypart)
			H.regenerating_bodypart = H.find_damaged_bodypart()
		if(H.regenerating_bodypart)
			H.nutrition -= 1
			H.regen_bodyparts(0, TRUE)
			return
	if(H.nutrition > 150)
		H.adjustBruteLoss(-(5 * regen_mod))
		H.adjustToxLoss(-(5 * regen_mod))
		H.adjustOxyLoss(-(5 * regen_mod))
		H.nutrition -= 5
