/datum/bodypart_controller/skeleton/homm_zombie
	name = "Homm_zombie Controller"
	bodypart_type = BODYPART_SKELETON


/datum/bodypart_controller/skeleton/homm_zombie/take_damage(brute = 0, burn = 0, damage_flags = 0, used_weapon = null)
	brute = round(brute * BP.owner.species.brute_mod, 0.1)
	burn = round(burn * BP.owner.species.burn_mod, 0.1)
	if(!BP.owner)
		return
	if((brute <= 0) && (burn <= 0))
		return 0

	playsound(BP.owner, pick(SOUNDIN_BONEBREAK), VOL_EFFECTS_MASTER, null, FALSE, null, -2)

	var/lose_bone_chance = 100
	if(brute < BP.min_broken_damage || burn < BP.min_broken_damage)
		lose_bone_chance = 5
	else if(brute < BP.min_broken_damage * 2 || burn < BP.min_broken_damage * 2)
		lose_bone_chance = 20

	if(prob(lose_bone_chance))
		if(!BP.cannot_amputate)
			BP.droplimb(null, null, DROPLIMB_EDGE)
		else if(BP.children.len) // hitting the chest will drop random attached bone
			var/obj/item/organ/external/OBP = pick(BP.children)
			OBP.droplimb(null, null, DROPLIMB_EDGE)

// BODYPARTS
/obj/item/organ/external/chest/skeleton/homm_zombie
	name = "Грудак зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 35
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

/obj/item/organ/external/head/skeleton/homm_zombie
	name = "Башка зомби"
	vital = FALSE
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 35
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

/obj/item/organ/external/groin/skeleton/homm_zombie
	name = "Пах зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 30
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

	cannot_amputate = FALSE
	vital = FALSE

/obj/item/organ/external/l_arm/skeleton/homm_zombie
	name = "Левая рука зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 30
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

/obj/item/organ/external/r_arm/skeleton/homm_zombie
	name = "Правая рука зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 30
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

/obj/item/organ/external/r_leg/skeleton/homm_zombie
	name = "Правая нога зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 30
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie

/obj/item/organ/external/l_leg/skeleton/homm_zombie
	name = "Левая нога зомби"
	leaves_stump = FALSE
	force = 8
	min_broken_damage = 30
	controller_type = /datum/bodypart_controller/skeleton/homm_zombie
