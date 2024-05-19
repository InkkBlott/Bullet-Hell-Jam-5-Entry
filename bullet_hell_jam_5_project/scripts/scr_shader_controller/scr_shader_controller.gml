global.shader_controller = {
	current: "", //string name of currently active shader
	
	//formatted arrays: [shader_asset, uniform_1, uniform_2, ...]. 
	//Each uniform: [uniform_handle, uniform_set_function]
	shaders: {
		"brightness contrast": [ shd_bright_contrast,
			//uniform 0: Brightness: (-1..1), 0 is neutral
			[shader_get_uniform(shd_bright_contrast,"brightness_amount"), shader_set_uniform_f],
			//uniform 1: Contrast: (-1..1), 0 is neutral
			[shader_get_uniform(shd_bright_contrast,"contrast_amount"), shader_set_uniform_f],
		],
		
		"color fill": [ shd_color_fill, //fills the sprite with the given color. Preserves alpha transparency.
			//uniform 0: Fill Color: vec4 array [R, G, B, A], each value normalized to 0..1
			[shader_get_uniform(shd_color_fill,"fill_color"), shader_set_uniform_f_array],
		],
		
		"color fill block": [ shd_color_fill_block, //fills the sprite with the given color. Preserves alpha transparency.
			//uniform 0: Fill Color: vec4 array [R, G, B, A], each value normalized to 0..1
			[shader_get_uniform(shd_color_fill_block,"fill_color"), shader_set_uniform_f_array],
			//uniform 1: Fill Block: vec2 array [horizontal_fill, vertical_fill] normalized to -1..1, (0 for either is no fill, 1 is full)
			[shader_get_uniform(shd_color_fill_block,"fill_block"), shader_set_uniform_f_array],
			//uniform 2: Texture UV Position: vec4 array [left, top, width, height], all in 0..1 UV scale. Can be sourced from sprite_get_uvs() and texture_get_uvs()
			[shader_get_uniform(shd_color_fill_block,"tex_uv_position"), shader_set_uniform_f_array],
		],
		
		"color invert": [ shd_color_invert ],
		
		"grayscale": [ shd_greyscale ],		
	},
	
	///@function set_shader(shader_name, [uniform1], [uniform2], ...)
	set_shader: function(_shader_name) {
		var sh = shaders[$ _shader_name]
		if (current != _shader_name) {
			shader_set(sh[0])
			current = _shader_name
		}
		for (var i=1; i<argument_count; i++) {
			var _ARG_ = argument[i]
			sh[i][1](sh[i][0], argument[i])
		}
	},
	
	///@function set_uniform(uniform_index, value)
	set_uniform: function(_index, _value) {
		var u = shaders[$ current][_index+1]
		u[1](u[0], _value)
	},
	
	///@function reset_shader()
	reset_shader: function() {
		shader_reset()
		current = ""
	},
}
#macro SHADER_CONTROLLER global.shader_controller