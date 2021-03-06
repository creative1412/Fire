#version 130
in vec4 vPosition;
in vec3 vNormal;
in vec2 vertexUV;

//view matrices
uniform mat4 model_view;
uniform mat4 projection;

//shading properties
uniform vec4 light_position;
uniform vec4 eye_position;


uniform float shininess;

// send the normals to each vertex so the fragment shader get the interpolated value of the normals
out vec3 N;
//same for K and E vectors
out vec3 L;
out vec3 E;

// Output data ; will be interpolated for each fragment.
out vec2 UV;


void main()
{
    gl_Position = projection * model_view * vPosition;
    N = normalize(vNormal.xyz);
    L = normalize(light_position.xyz - vPosition.xyz);
    E = normalize(eye_position - vPosition).xyz;
    UV = vertexUV;
}





