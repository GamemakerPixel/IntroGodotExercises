shader_type spatial;

uniform float uv_scale = 1.0;

void fragment() {
	vec2 polarizedUV = UV.xy * vec2(2) - vec2(1);
	vec2 scaledUV = polarizedUV * vec2(uv_scale);
	vec2 isOdd = vec2(
		floor(sin(TAU * scaledUV.x) + 1.0),
		floor(sin(TAU * scaledUV.y) + 1.0)
	);
	
	float value = 0.0;
	
	if (isOdd.x == isOdd.y){
		value = 1.0;
	}
	
	ALBEDO.rgb = vec3(value);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
