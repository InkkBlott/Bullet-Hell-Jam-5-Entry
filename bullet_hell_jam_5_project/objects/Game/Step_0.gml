#region DEV COMMANDS

if (keyboard_check_pressed(ord("R"))) game_restart()
if (keyboard_check_pressed(vk_escape)) game_end()

#endregion

if (paused) {
	if (pause_event == PAUSE_EVENT.PLAYER_PAUSE) {
		if (keyboard_check_pressed(vk_enter)) toggle_pause()
	}
	else if (pause_event == PAUSE_EVENT.HITSTOP_MINOR or pause_event == PAUSE_EVENT.HITSTOP_MAJOR) {
		if ((hitstop --) <= 0) toggle_pause()
	}
}