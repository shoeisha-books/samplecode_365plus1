～頂点シェーダー～

#version 450

layout(location = 0) in vec4 inPos;
layout(location = 1) in vec2 inTextureUV;

out vec2 outTextureUV;

uniform mat4 mvp;

void main()
{
    gl_Position = mvp * inPos;
    outTextureUV = inTextureUV;
}

～フラグメントシェーダー～
#version 450

in vec2 textureUV;
out vec3 color;
uniform sampler2D sampler;

void main()
{
    color = texture(sampler, textureUV).rgb;
}

