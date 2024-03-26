shader_type spatial;


uniform vec4 text_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float text_size : hint_range(0.1, 100.0) = 24.0;
uniform sampler2D font_texture : source_color;

void fragment() {
    // Convert the UV coordinates to pixel coordinates
    vec2 pixel_coords = SCREEN_UV * TEXTURE_SIZE(font_texture);

    // Sample the font texture to get the character
    float character = texture(font_texture, UV).r;

    // Set the output color based on the text color property
    ALBEDO = text_color.rgb * character;
    ALPHA = text_color.a * character;
}
