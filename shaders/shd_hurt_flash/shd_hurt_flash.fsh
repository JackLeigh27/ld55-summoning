//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 original = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float mean = (original.r + original.g + original.b) / 3.0;
	
    gl_FragColor = vec4(1.0, mean, mean, original.a);
}
