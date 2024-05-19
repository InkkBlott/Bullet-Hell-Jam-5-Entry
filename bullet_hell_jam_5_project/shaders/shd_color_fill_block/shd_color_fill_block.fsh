varying vec2 v_vTexcoord;
uniform vec4 fill_color;
uniform vec2 fill_block;
uniform vec4 tex_uv_position;

void main()
{
	vec2 relative_texcoord = vec2((v_vTexcoord[0]-tex_uv_position[0])/tex_uv_position[2], (v_vTexcoord[1]-tex_uv_position[1])/tex_uv_position[3]); //0..1
	if ((relative_texcoord[0] < fill_block[0] || relative_texcoord[0] >= fill_block[0]+1.0) && (relative_texcoord[1] < fill_block[1] || relative_texcoord[1] >= fill_block[1]+1.0)) {
		gl_FragColor = vec4(fill_color.rgb, fill_color.a*texture2D( gm_BaseTexture, v_vTexcoord ).a);
	} else {
		gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
	}
}
