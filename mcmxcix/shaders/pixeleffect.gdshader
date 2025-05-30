shader_type canvas_item;
render_mode skip_vertex_transform, unshaded;

const vec2 target_resolation = vec2(420.0, 280.0);

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	vec2 uv = floor(SCREEN_UV * target_resolation) / target_resolation;
	
	COLOR = texture(screen_texture, uv);
}

//Thank you DevPoodle! <3     video: https://www.youtube.com/watch?v=dHbqsr-KjOg&t=363s