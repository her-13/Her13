
/datum/outfit/job/hub
	name = OUTFIT_JOB_NAME("Hub")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/black
	back = /obj/item/weapon/storage/backpack/santabag
	l_ear = null
	belt = null
	id = null
	survival_box = FALSE

/datum/outfit/job/deadman
	name = OUTFIT_JOB_NAME("Hub")
	uniform = /obj/item/clothing/under/shorts/black
	shoes = /obj/item/clothing/shoes/sandal
	back = null
	l_ear = null
	belt = null
	id = null

// ЭРАФИЯ

/datum/outfit/job/hub/peasant
	name = OUTFIT_JOB_NAME("Peasant")
	uniform = /obj/item/clothing/under/peasant
	uniform_f = /obj/item/clothing/under/peasant_fem
	shoes = /obj/item/clothing/shoes/leather
	l_hand =/obj/item/weapon/hatchet
	id = /obj/item/weapon/card/id/key/peasant

/datum/outfit/job/hub/smith
	name = OUTFIT_JOB_NAME("Smith")
	uniform =/obj/item/clothing/under/smith
	shoes =/obj/item/clothing/shoes/boots/work
	l_hand = /obj/item/weapon/smith_hammer
	gloves = /obj/item/clothing/gloves/black
	suit = /obj/item/clothing/suit/chef/classic
	id = /obj/item/weapon/card/id/key/peasant

/datum/outfit/job/hub/miner
	name = OUTFIT_JOB_NAME("Miner")
	uniform = /obj/item/clothing/under/peasant
	shoes = /obj/item/clothing/shoes/leather
	l_hand = /obj/item/weapon/pickaxe/silver
	id = /obj/item/weapon/card/id/key/peasant

/datum/outfit/job/hub/helper
	name = OUTFIT_JOB_NAME("Helper")
	uniform = /obj/item/clothing/under/pants/black
	suit = /obj/item/clothing/suit/monk_helper
	shoes = /obj/item/clothing/shoes/leather
	head = /obj/item/clothing/head/monk_helper
	l_hand = /obj/item/weapon/staff/broom/monk
	l_pocket_back = /obj/item/weapon/paper/village_law
	id = /obj/item/weapon/card/id/key/helper


/datum/outfit/job/hub/plague_doctor
	name = OUTFIT_JOB_NAME("Plague Doctor")
	uniform = /obj/item/clothing/under/pants/black
	l_pocket_back = /obj/item/weapon/paper/village_law
	head = /obj/item/clothing/head/plaguedoctorhat
	mask = /obj/item/clothing/mask/gas/plaguedoctor
	suit = /obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	shoes = /obj/item/clothing/shoes/leather
	gloves = /obj/item/clothing/gloves/latex
	l_hand =/obj/item/stack/medical/advanced/bruise_pack
	r_hand = /obj/item/stack/medical/advanced/ointment
	id = /obj/item/weapon/card/id/key/doctor
	back = /obj/item/weapon/storage/backpack/satchel

/datum/outfit/job/hub/headman
	name = OUTFIT_JOB_NAME("Headman")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/latex
	suit = /obj/item/clothing/suit/headman
	head =/obj/item/clothing/head/headman
	r_hand =/obj/item/weapon/paper/village_law
	id = /obj/item/weapon/card/id/key/headman
	back = /obj/item/weapon/storage/backpack/satchel

/datum/outfit/job/hub/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/innkeeper
	shoes = /obj/item/clothing/shoes/boots/work
	id = /obj/item/weapon/card/id/key/innkeeper
	back = /obj/item/weapon/storage/backpack/satchel
	l_pocket_back = /obj/item/weapon/paper/village_law
	r_hand = /obj/item/weapon/reagent_containers/glass/rag
	l_hand = /obj/item/weapon/melee/classic_baton
	head =/obj/item/clothing/head/inn

/datum/outfit/job/hub/knight
	name = OUTFIT_JOB_NAME("Knight")
	uniform =/obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/armor/crusader
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/crusader
	l_hand = /obj/item/weapon/claymore/religion
	l_pocket_back = /obj/item/weapon/paper/village_law
	back = null
	id = /obj/item/weapon/card/id/key/knight


/datum/outfit/job/hub/monk
	name = OUTFIT_JOB_NAME("Monk")
	uniform =/obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/wizrobe/monk
	shoes = /obj/item/clothing/shoes/sandal
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/wizard/monk
	l_pocket_back = /obj/item/weapon/paper/village_law
	l_hand = /obj/item/weapon/nullrod
	back = null
	id = /obj/item/weapon/card/id/key/monk

/datum/outfit/job/hub/human_hero
	name = OUTFIT_JOB_NAME("Human Hero")
	uniform =/obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/armor/crusader
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/byzantine_hat
	mask = /obj/item/clothing/mask/lord
	l_pocket_back = /obj/item/weapon/paper/village_law
	r_hand = /obj/item/toy/flag
	back = null
	id = /obj/item/weapon/card/id/key/hhero



//НЕЙТРАЛЫ

/datum/outfit/job/hub/lepr
	name = OUTFIT_JOB_NAME("Лепрекон")
	uniform =/obj/item/clothing/under/lepr
	shoes = /obj/item/clothing/shoes/lepr
	gloves = /obj/item/clothing/gloves/latex
	head = /obj/item/clothing/head/lepr
	l_hand = /obj/item/weapon/cane