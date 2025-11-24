shader_type spatial;
uniform sampler2D _albedo: source_color;
global uniform vec4 cutoff_color: source_color;
uniform sampler2D _noise;
uniform mat4 cutplane;
varying vec3 wvtx;
render_mode cull_disabled;

void vertex() {
	// World space
	wvtx = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	vec3 planeNormal = normalize(cutplane[2].xyz);
	float planeDist = dot(planeNormal, cutplane[3].xyz);
	float vertexDist = dot(planeNormal, wvtx);
	float dist = vertexDist - planeDist;

	/*ADD NOISE TO BORDER
	vec4 clip_pos = PROJECTION_MATRIX * vec4(VERTEX, 1.0);
	vec2 uv = clip_pos.xy/5.0;

	uv+=TIME * 0.04;
	float noise = texture(_noise, uv).r;
	dist += noise*0.3;
	*/

	//invis
	if(dist < 0.0) discard;

	//add border
	float border_dist = smoothstep(0.0, 0.2, dist);
	vec4 alb_color = texture(_albedo, UV);
	ALBEDO = (mix(cutoff_color, alb_color, border_dist)).rgb;
	EMISSION = (mix(cutoff_color * 0.7, vec4(0.0), border_dist)).rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
