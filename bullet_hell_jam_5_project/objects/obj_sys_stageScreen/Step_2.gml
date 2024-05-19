if (pause_buffer and keyboard_check_pressed(vk_enter)) {
	GAME.toggle_pause(PAUSE_EVENT.PLAYER_PAUSE)
	pause_buffer = false
} else if (!pause_buffer) pause_buffer = true 