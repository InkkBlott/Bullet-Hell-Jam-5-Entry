if (scrolling_x != 0 or scrolling_y != 0) {
	with (obj_enemy) {
		if (scroll_with_stage) {
			x += scrolling_x*scroll_factor
			y += scrolling_y*scroll_factor
		}
	}
	with (obj_enemyAttack) {
		if (scroll_with_stage) {
			x += scrolling_x*scroll_factor
			y += scrolling_y*scroll_factor
		}
	}
	with (obj_stageProp) {
		if (scroll_with_stage) {
			x += scrolling_x*scroll_factor
			y += scrolling_y*scroll_factor
		}
	}
}

if (!PLAYER_INSTANCE.alive and !GAME.timeline_running) instance_set_timeline(GAME, tml_sys_playerDeath)