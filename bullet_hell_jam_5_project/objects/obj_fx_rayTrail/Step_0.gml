// Inherit the parent event
event_inherited();

if (image_angle != direction) image_angle = direction
image_yscale -= shrink_rate
if (image_yscale <= 0) instance_destroy()