shader_type canvas_item;

uniform sampler2D texture_1;
uniform sampler2D texture_2;
uniform float blend_factor = 0.5; // Adjust this value to control the blending

void fragment() {
    vec4 color_1 = texture(texture_1, UV);
    vec4 color_2 = texture(texture_2, UV);

    vec4 final_color = mix(color_1, color_2, blend_factor);

    COLOR = final_color;
}
