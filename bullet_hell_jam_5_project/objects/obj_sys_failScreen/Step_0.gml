if (keyboard_check_pressed(vk_left)) {
	selection = 1
	fail_option_text_yes.blend(c_white, 1)
	fail_option_text_no.blend(c_gray, 1)
}
else if (keyboard_check_pressed(vk_right)) {
	selection = 2
	fail_option_text_yes.blend(c_gray, 1)
	fail_option_text_no.blend(c_white, 1)
}

if (keyboard_check_pressed(vk_enter)) {
	if (selection == 1) room_goto(rm_Stage) else if (selection == 2) room_goto(rm_Title)
}