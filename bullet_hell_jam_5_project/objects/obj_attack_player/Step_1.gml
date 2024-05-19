//process collision array
for (var i=array_length(collisions)-1; i>=0; i--) {
	if (collisions[i][1] != undefined) {
		collisions[i][1] --
		if (collisions[i][1] <= 0) array_delete(collisions, i, 1)
	}
}