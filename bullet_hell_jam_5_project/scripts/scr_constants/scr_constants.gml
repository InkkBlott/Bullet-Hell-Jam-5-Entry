#macro c_fire #fc5130
#macro c_ice #30bced
#macro c_lightning #ffe97a
#macro c_richBlack #262626

//depth levels
enum DEPTH_LEVEL {
	HUD,
	FOREGROUND,
	ENEMY_ATTACKS_MAJOR,
	ENEMY_ATTACKS,
	PLAYER_CHARACTER,
	PLAYER_EFFECTS,
	PLAYER_ATTACKS,
	SMALL_ENEMIES,
	SMALL_ENEMY_EFFECTS,
	BIG_ENEMY_EFFECTS,
	BIG_ENEMIES,
	BACKGROUND,
	STAGE_BACKDROP,
}

//Pause events
//passed as an argument to determine what the Game object does when pause is toggled
enum PAUSE_EVENT {
	PLAYER_PAUSE,
	HITSTOP_MINOR,
	HITSTOP_MAJOR,
}

//Character action codes
//comments include additional parameters. [bracketed] params are optional
//param type legend: (# = number) (@ = asset) ({} = function) ([] = array) (? = boolean)
enum CHARACTER_ACTION {
	WAIT, // #frames
	FACE_DIRECTION, // #direction, [#turn_speed]
	MOVE_DIRECTION, // #direction, #speed, [#frames]
	MOVE_POSITION, // #pos_x, #pos_y, #frames, [@anim_curve]
	MOVE_PATH, // @path, #frames, [@anim_curve]
	TIMELINE, // @timeline, [?wait_until_done]
	ATTACK, // [?wait_until_done]
	METHOD, // {}method_function, [[]argument_array]
	DESTROY, // (no args)
}

//Character action queue labels
enum ACTION_QUEUE_LABEL {
	DEFAULT,
	PLAYER_SPAWN,
}