// ------------------------------------------------------------------
// OUTPUT VARIABLES -------------------------------------------------
// ------------------------------------------------------------------

out vec2 FS_IN_TexCoord;

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    FS_IN_TexCoord = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2);
    gl_Position    = vec4(FS_IN_TexCoord * 2.0f - 1.0f, 1.0f, 1.0f);
}

// ------------------------------------------------------------------