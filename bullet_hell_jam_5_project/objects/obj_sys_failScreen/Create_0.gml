fail_prompt_text = scribble("Continue?").scale(2).align(fa_center, fa_top)
fail_option_text_yes = scribble("YES <").scale(1.5).align(fa_right, fa_middle).blend(c_gray, 1)
fail_option_text_no = scribble("> NO").scale(1.5).align(fa_left, fa_middle).blend(c_gray, 1)

selection = 0 //0: undecided, 1: yes, 2: no