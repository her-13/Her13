
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
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
	id = /obj/item/weapon/card/id/key/helper


/datum/outfit/job/hub/plague_doctor
	name = OUTFIT_JOB_NAME("Plague Doctor")
	uniform = /obj/item/clothing/under/pants/black
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
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
	r_hand =/obj/item/weapon/paper/scroll/village_law
	id = /obj/item/weapon/card/id/key/headman
	back = /obj/item/weapon/storage/backpack/satchel

/datum/outfit/job/hub/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/innkeeper
	shoes = /obj/item/clothing/shoes/boots/work
	id = /obj/item/weapon/card/id/key/innkeeper
	back = /obj/item/weapon/storage/backpack/satchel
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
	r_hand = /obj/item/weapon/reagent_containers/glass/rag
	l_hand = /obj/item/weapon/melee/classic_baton
	head =/obj/item/clothing/head/inn

/datum/outfit/job/hub/knight
	name = OUTFIT_JOB_NAME("Knight")
	uniform =/obj/item/clothing/under/knight
	suit = /obj/item/clothing/suit/armor/knight
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/crusader
	l_hand = /obj/item/weapon/claymore/religion
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
	back = null
	id = /obj/item/weapon/card/id/key/knight


/datum/outfit/job/hub/monk
	name = OUTFIT_JOB_NAME("Monk")
	uniform =/obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/wizrobe/monk
	shoes = /obj/item/clothing/shoes/sandal
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/wizard/monk
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
	l_hand = /obj/item/weapon/nullrod
	r_hand = /obj/item/weapon/storage/bible
	back = null
	id = /obj/item/weapon/card/id/key/monk

/datum/outfit/job/hub/human_hero
	name = OUTFIT_JOB_NAME("Human Hero")
	uniform =/obj/item/clothing/under/knight
	suit = /obj/item/clothing/suit/armor/knight/lord
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/lord
	l_pocket_back = /obj/item/weapon/paper/scroll/village_law
	r_hand = /obj/item/flag
	back = null
	id = /obj/item/weapon/card/id/key/hhero

/datum/outfit/job/hub/angel
	name = OUTFIT_JOB_NAME("Angel")
	shoes = /obj/item/clothing/shoes/roman
	uniform = null
	r_hand = /obj/item/clothing/under/toga
	l_hand = /obj/item/angel_sword
	back = null

//НЕЙТРАЛЫ

/datum/outfit/job/hub/lepr
	name = OUTFIT_JOB_NAME("Лепрекон")
	uniform =/obj/item/clothing/under/lepr
	shoes = /obj/item/clothing/shoes/lepr
	gloves = /obj/item/clothing/gloves/latex
	head = /obj/item/clothing/head/lepr
	l_hand = /obj/item/weapon/cane

/datum/outfit/job/hub/kazak
	name = OUTFIT_JOB_NAME("Казак")
	uniform =/obj/item/clothing/under/gigachad
	shoes = /obj/item/clothing/shoes/gigachad

/datum/outfit/job/hub/kazak_elder
	name = OUTFIT_JOB_NAME("Старший Казак")
	uniform =/obj/item/clothing/under/gigachad
	shoes = /obj/item/clothing/shoes/gigachad
	suit = /obj/item/clothing/suit/gigachad
	head = /obj/item/clothing/head/papaha

/datum/outfit/job/hub/forest_archer
	name = OUTFIT_JOB_NAME("Лесничий")
	uniform =/obj/item/clothing/under/forest_archer
	shoes = /obj/item/clothing/shoes/boots/work
	head = /obj/item/clothing/head/pilotka
	r_hand = /obj/item/weapon/crossbow
	l_hand = /obj/item/weapon/arrow/harpoon

/datum/outfit/job/hub/forest_knight
	name = OUTFIT_JOB_NAME("Лесной Страж")
	uniform =/obj/item/clothing/under/telnajka
	shoes = /obj/item/clothing/shoes/boots/work
	suit = /obj/item/clothing/suit/armor/knight/wooden_knight
	head = /obj/item/clothing/head/helmet/wooden_knight
	l_hand = /obj/item/weapon/spear

/datum/outfit/job/hub/bard
	name = OUTFIT_JOB_NAME("Бард")
	uniform =/obj/item/clothing/under/bard
	shoes = /obj/item/clothing/shoes/bard
	head = /obj/item/clothing/head/bard
	l_hand = /obj/item/device/guitar

/datum/outfit/job/hub/farseer
	name = OUTFIT_JOB_NAME("Farseer")
	uniform =/obj/item/clothing/under/farseer
	uniform_f = /obj/item/clothing/under/farseer_fem
	shoes = /obj/item/clothing/shoes/golden_sandal
	head = /obj/item/clothing/head/turban
	l_hand = /obj/item/clothing/head/tiara
	r_hand = /obj/item/toy/cards

/datum/outfit/job/hub/valera
	name = OUTFIT_JOB_NAME("Валера")
	uniform =/obj/item/clothing/under/valera
	shoes = /obj/item/clothing/shoes/valera

//НЕКРОПОЛИС

/datum/outfit/job/hub/lich
	name = OUTFIT_JOB_NAME("Лич")
	uniform =/obj/item/clothing/under/lich
	shoes = /obj/item/clothing/shoes/sandal
	head = /obj/item/clothing/head/lich
	l_hand = /obj/item/lich_staff
	back = null

/datum/outfit/job/hub/skeleton
	name = OUTFIT_JOB_NAME("Скелет")
	uniform = /obj/item/clothing/under/zombie_pants
	shoes = /obj/item/clothing/shoes/sandal
	r_hand = /obj/item/skeleton_sword/tesak
	back = null

/datum/outfit/job/hub/skeleton/warrior
	name = OUTFIT_JOB_NAME("Скелет-воин")
	uniform = /obj/item/clothing/under/zombie_pants
	shoes = /obj/item/clothing/shoes/skeleton_war
	head = /obj/item/clothing/head/helmet/skeleton_war
	suit = /obj/item/clothing/suit/armor/skeleton_war
	r_hand = /obj/item/skeleton_sword
	l_hand = /obj/item/weapon/shield/buckler
	back = null

/datum/outfit/job/hub/death_knight
	name = OUTFIT_JOB_NAME("Черный Рыцарь")
	uniform =/obj/item/clothing/under/knight
	suit = /obj/item/clothing/suit/armor/death_knight
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/death_knight
	r_hand = /obj/item/skeleton_sword
	back = null

/datum/outfit/job/hub/arc_lich
	name = OUTFIT_JOB_NAME("Архилич")
	uniform =/obj/item/clothing/under/arch_lich
	shoes = /obj/item/clothing/shoes/sandal
	l_hand = /obj/item/lich_staff
	back = null
