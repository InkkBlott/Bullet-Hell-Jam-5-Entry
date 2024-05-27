if (__pause_instance_deactivation) { //delayed to prevent code-skipping
	if (paused) instance_deactivate_all(true)
	__pause_instance_deactivation = false
}