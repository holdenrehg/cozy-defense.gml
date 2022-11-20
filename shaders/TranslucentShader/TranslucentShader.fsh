//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(
		min(texColor.r + 0.4, 1.0), 
		min(texColor.g + 0.4, 1.0), 
		min(texColor.b + 0.4, 1.0), 
		texColor.a
	);
}
