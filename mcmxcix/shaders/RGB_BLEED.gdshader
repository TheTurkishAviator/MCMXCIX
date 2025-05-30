shader_type canvas_item;



// Adjust these in the Inspector!
uniform float rgb_split_amount : hint_range(0.0, 3) = 3;
uniform float distortion_strength : hint_range(0.0, 3) = 3;
uniform float scanline_opacity : hint_range(0.0, 3) = 3;
uniform float speed : hint_range(0.0, 5.0) = 1.0;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    // Horizontal distortion (VHS-style wobble)
    float distortion = distortion_strength * sin(UV.y * 50.0 + TIME * speed);
    vec2 distorted_uv = UV + vec2(distortion, 0.0);
	
    // RGB split (color bleed)
    float r = texture(TEXTURE, distorted_uv + vec2(rgb_split_amount, 0.0)).r;
    float g = texture(TEXTURE, distorted_uv).g;
    float b = texture(TEXTURE, distorted_uv - vec2(rgb_split_amount, 0.0)).b;
	
    // Scanlines (alternating dark lines)
    float scanline = floor(mod(UV.y * 200.0, 2.0)) * scanline_opacity;
    vec3 color = vec3(r, g, b) * (1.0 - scanline);
	
	    vec3 final_color = vec3(r, g, b) * COLOR.rgb;

    
    // Final output
    COLOR = vec4(vec3(r, g, b) * vec3(1.0, 0.0, 0.0), 1.0); // Red tint
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
