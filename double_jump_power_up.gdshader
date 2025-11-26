shader_type spatial;
render_mode specular_schlick_ggx;

// Godot 4 usa este formato:
uniform vec4 ColorUniform : source_color;
uniform float HowShiny = 2.0;
uniform float Roughness = 0.2;

void vertex() {
}

void fragment() {
    ALBEDO = ColorUniform.rgb;
    METALLIC = HowShiny;
    ROUGHNESS = Roughness;
}

void light() {
}