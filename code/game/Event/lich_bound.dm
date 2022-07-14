#define BOUNDED_TIP "Is bounded."
#define BOUNDS_TIP(B) "Is bounding [B.parent]."

// ¬се тоже самое ,но с заменой AM.move на пожирание нутриентов
// A component you put on things you want to be bounded to other things.
// Warning! Can only be bounded to one thing at once.
/datum/component/bounded_lich
	var/atom/bound_to
	var/min_dist = 0
	var/max_dist = 0
	// Does the component have a visible radius?
	var/vis_radius = TRUE

	// This callback can be used to customize how out-of-bounds situations are
	// resolved. Return TRUE if the situation was resolved.
	// This component will pass itself into it.
	var/datum/callback/resolve_callback
	// Time to hide visible raduis
	var/hide_radius_timer

/datum/component/bounded_lich/Initialize(atom/_bound_to, _min_dist, _max_dist, datum/callback/_resolve_callback, tips = TRUE, _vis_radius = TRUE)
	bound_to = _bound_to
	min_dist = _min_dist
	max_dist = _max_dist
	vis_radius = _vis_radius

	resolve_callback = _resolve_callback

	RegisterSignal(bound_to, list(COMSIG_MOVABLE_MOVED, COMSIG_MOVABLE_LOC_MOVED), .proc/check_bounds)
	RegisterSignal(bound_to, list(COMSIG_PARENT_QDELETING), .proc/on_bound_destroyed)
	RegisterSignal(parent, list(COMSIG_PARENT_QDELETING), .proc/on_bound_destroyed)
	RegisterSignal(parent, list(COMSIG_MOVABLE_MOVED), .proc/check_bounds)
	RegisterSignal(parent, list(COMSIG_MOVABLE_PRE_MOVE), .proc/on_try_move)

	if(tips)
		var/datum/mechanic_tip/bounded/bounded_tip = new(src)
		var/datum/mechanic_tip/bound/bound_tip = new(src)

		parent.AddComponent(/datum/component/mechanic_desc, list(bounded_tip))
		bound_to.AddComponent(/datum/component/mechanic_desc, list(bound_tip))

	if(vis_radius && ismob(parent))
		bound_to.AddComponent(/datum/component/vis_radius, _max_dist)

	// First bounds update.
	check_bounds()

/datum/component/bounded_lich/Destroy()
	UnregisterSignal(bound_to, list(COMSIG_MOVABLE_MOVED, COMSIG_MOVABLE_LOC_MOVED))

	SEND_SIGNAL(parent, COMSIG_TIPS_REMOVE, list(BOUNDED_TIP))
	SEND_SIGNAL(bound_to, COMSIG_TIPS_REMOVE, list(BOUNDS_TIP(src)))

	if(vis_radius)
		qdel(bound_to.GetComponent(/datum/component/vis_radius))
		deltimer(hide_radius_timer)

	bound_to = null
	return ..()

// This proc is called when we are for some reason out of bounds.
// The default bounds resolution does not take in count density, or etc.
/datum/component/bounded_lich/proc/resolve_stranded()
	if(resolve_callback && resolve_callback.Invoke(src))
		return
	var/mob/living/carbon/human/H = parent
	to_chat(H, "<span class='warning'><b>я не могу далеко отходить от посоха хоз€ина. Ёто истощает мен€</b></span>")
	H.nutrition  -=25
	if(H.nutrition  <0)
		H.nutrition  = 0

// Is called when bounds are inside bounded(or vice-versa), yet they shouldn't be.
/datum/component/bounded_lich/proc/jump_out_of(atom/container, atom/movable/escapee)
	if(isitem(escapee))
		if(istype(container, /obj/item/weapon/storage))
			var/obj/item/weapon/storage/S = container
			S.remove_from_storage(escapee, get_turf(container))
		else if(istype(container, /mob))
			var/mob/M = container
			M.drop_from_inventory(escapee, get_turf(container))

// This proc is called when the bounds move.
/datum/component/bounded_lich/proc/check_bounds()
	var/dist = get_dist(parent, get_turf(bound_to))
	if(dist < min_dist || dist > max_dist)
		var/mob/living/carbon/human/H = parent
		var/area/current = get_turf(H)
		if(current.loc.name != "Necropolis")// Ќа своей территории можно гул€ть спокойно
			resolve_stranded()

// This proc is called when bound thing tries to move.
/datum/component/bounded_lich/proc/on_try_move(datum/source, atom/newLoc, dir)
	var/turf/T = get_turf(bound_to)
	var/dist = get_dist(newLoc, T)
	if(dist == -1 && newLoc == T)
		dist = 0
	if(dist < min_dist || dist > max_dist)
		try_show_radius()

/datum/component/bounded_lich/proc/change_max_dist(dist)
	max_dist = dist
	if(vis_radius && ismob(parent))
		// Del old
		qdel(bound_to.GetComponent(/datum/component/vis_radius))
		deltimer(hide_radius_timer)
		// Create new
		bound_to.AddComponent(/datum/component/vis_radius, max_dist)

/datum/component/bounded_lich/proc/try_show_radius()
	if(!ismob(parent))
		return

	var/mob/M = parent
	if(M.client)
		SEND_SIGNAL(bound_to, COMSIG_SHOW_RADIUS, parent)
		if(hide_radius_timer)
			deltimer(hide_radius_timer)
		hide_radius_timer = addtimer(CALLBACK(src, .proc/hide_radius), 20, TIMER_STOPPABLE)

/datum/component/bounded_lich/proc/hide_radius()
	SEND_SIGNAL(bound_to, COMSIG_HIDE_RADIUS)

/datum/component/bounded_lich/proc/on_bound_destroyed(force)
	// Perhaps add an abilities to resolve this situation with a callback? ~Luduk
	qdel(src)

#undef BOUNDED_TIP
#undef BOUNDS_TIP
