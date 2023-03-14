#include <noise.glsl>

// ------------------------------------------------------------------
// INPUTS -----------------------------------------------------------
// ------------------------------------------------------------------

layout(local_size_x = 8, local_size_y = 8, local_size_z = 8) in;

// ------------------------------------------------------------------
// UNIFORMS ---------------------------------------------------------
// ------------------------------------------------------------------

layout(binding = 0, r16f) uniform image3D i_Noise;

uniform int u_Size;

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    vec3 tex_coord = (vec3(gl_GlobalInvocationID) + vec3(0.5f)) / float(u_Size);

    float freq = 8.0f;

    float worley0 = worley_fbm(tex_coord, freq);
    float worley1 = worley_fbm(tex_coord, freq * 2.0f);
    float worley2 = worley_fbm(tex_coord, freq * 4.0f);
 
    float worley = worley0 * 0.625f + worley1 * 0.125f + worley2 * 0.25f; 
    
    imageStore(i_Noise, ivec3(gl_GlobalInvocationID), vec4(worley));
}

// ------------------------------------------------------------------