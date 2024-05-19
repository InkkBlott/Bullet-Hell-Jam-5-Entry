varying vec2 v_vTexcoord;
uniform vec4 fill_color;

void main()
{
    gl_FragColor = vec4(fill_color.rgb, fill_color.a*texture2D( gm_BaseTexture, v_vTexcoord ).a);
}
