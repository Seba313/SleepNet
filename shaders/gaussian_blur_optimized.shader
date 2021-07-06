shader_type canvas_item;

uniform vec2 blur_scale = vec2(1, 0);

void fragment() {
	const float SAMPLES = 71.0;
	const float WEIGHTS[70] = {
		0.000008,
		0.000014,
		0.000022,
		0.000035,
		0.000054,
		0.000084,
		0.000127,
		0.000189,
		0.000279,
		0.000405,
		0.00058,
		0.00082,
		0.001141,
		0.001567,
		0.002121,
		0.002831,
		0.003726,
		0.004835,
		0.006186,
		0.007804,
		0.009708,
		0.011908,
		0.014402,
		0.017174,
		0.020194,
		0.023412,
		0.026764,
		0.030168,
		0.033529,
		0.036743,
		0.039703,
		0.042301,
		0.044438,
		0.046031,
		0.047013,
		0.047346,
		0.047013,
		0.046031,
		0.044438,
		0.042301,
		0.039703,
		0.036743,
		0.033529,
		0.030168,
		0.026764,
		0.023412,
		0.020194,
		0.017174,
		0.014402,
		0.011908,
		0.009708,
		0.007804,
		0.006186,
		0.004835,
		0.003726,
		0.002831,
		0.002121,
		0.001567,
		0.001141,
		0.00082,
		0.00058,
		0.000405,
		0.000279,
		0.000189,
		0.000127,
		0.000084,
		0.000054,
		0.000035,
		0.000022,
		0.000014
	};
	
	vec2 scale = TEXTURE_PIXEL_SIZE * blur_scale;
	
	float weight = 0.0;
	float total_weight = 0.0;
	vec4 color = vec4(0.0);
	
	for(int i=-int(SAMPLES)/2; i < int(SAMPLES)/2; ++i) {
		int w = i + int(SAMPLES)/2;
		weight = WEIGHTS[w];
		color.rgb += texture(TEXTURE, UV + scale * vec2(float(i))).rgb * weight;
		total_weight += weight;
	}
	
	COLOR.rgb = color.rgb / total_weight;
}