var/global/list/datum/cameranet/cameranets

/datum/component/camerabearer
	var/obj/machinery/camera/camera
	var/datum/cameranet/net

/datum/component/camerabearer/Initialize(net_name)
	var/atom/A = parent
	camera = new(A)

	cameranet.cameras -= camera

	camera.replace_networks(list(net_name))
	cameranet.removeCamera(camera)

	net = init_net(net_name)
	net.cameras += camera
	net.addCamera(camera)

	RegisterSignal(A, list(COMSIG_MOVABLE_MOVED, COMSIG_MOVABLE_LOC_MOVED), .proc/update_camera_pos)

/datum/component/camerabearer/Destroy()
	UnregisterSignal(parent, list(COMSIG_MOVABLE_MOVED, COMSIG_MOVABLE_LOC_MOVED))

	net.cameras -= camera

	QDEL_NULL(camera)
	net = null

	return ..()

/datum/component/camerabearer/proc/update_camera_pos(datum/source)
	net.updatePortableCamera(source)

/datum/component/camerabearer/proc/init_net(net_name)
	var/datum/cameranet/N = LAZYACCESS(global.cameranets, net_name)
	if(N)
		return N

	N = new
	LAZYSET(global.cameranets, net_name, N)
	return N
