event_inherited()

if (rotation_factor > 0) {
	direction += speed * rotation_sign * rotation_factor
	rotation_factor -= 0.0033 * speed
}
image_angle += 22 * rotation_sign