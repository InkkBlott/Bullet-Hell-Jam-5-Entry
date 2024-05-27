#region Generated Paths

global.paths = {}
#macro PATHS global.paths

PATHS.circle_small = path_add()
PATHS.circle_small_ccw = path_add()
PATHS.circle_med = path_add()
PATHS.circle_med_ccw = path_add()
PATHS.circle_large = path_add()
PATHS.circle_large_ccw = path_add()
path_set_closed(PATHS.circle_small, true)
path_set_closed(PATHS.circle_small_ccw, true)
path_set_closed(PATHS.circle_med, true)
path_set_closed(PATHS.circle_med_ccw, true)
path_set_closed(PATHS.circle_large, true)
path_set_closed(PATHS.circle_large_ccw, true)
var size_s = 25, size_m = 50, size_l = 100
for (var i=0; i<360; i+=10) {
	path_add_point(PATHS.circle_small, 0-dcos(i+90)*size_s, size_s-(dsin(i+90)*size_s), 100)
	path_add_point(PATHS.circle_small_ccw, dcos(i+90)*size_s, size_s-(dsin(i+90)*size_s), 100)
	path_add_point(PATHS.circle_med, 0-dcos(i+90)*size_m, size_m-(dsin(i+90)*size_m), 100)
	path_add_point(PATHS.circle_med_ccw, dcos(i+90)*size_m, size_m-(dsin(i+90)*size_m), 100)
	path_add_point(PATHS.circle_large, 0-dcos(i+90)*size_l, size_l-(dsin(i+90)*size_l), 100)
	path_add_point(PATHS.circle_large_ccw, dcos(i+90)*size_l, size_l-(dsin(i+90)*size_l), 100)
}

#endregion

#region Action Queues

global.action_queues = {}
#macro STOCK_ACTION_QUEUES global.action_queues

STOCK_ACTION_QUEUES.test = [
	[CHARACTER_ACTION.WAIT, 120],
	[CHARACTER_ACTION.ATTACK],
	[CHARACTER_ACTION.MOVE_PATH, PATHS.circle_small, 120],
]

#endregion