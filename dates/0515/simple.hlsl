float4x4 mvp : register(b0);
Texture2D tex : register(t0);
SamplerState sampler : register(s0);

struct Vertex_In
{
    float4 position: POSITION;
    float2 textureUV: TEXCOORD;
};
struct Vertex_Out
{
    float4 position: SV_POSITION;
    float2 textureUV: TEXCOORD;
};

Vertex_Out vertMain(Vertex_In in)
{
    Vertex_Out out;
    out.position = in.position * mvp;
    out.textureUV = in.textureUV;
    return out;
}

float4 fragMain(Vertex_Out in)
{
    return tex.Sample(sampler, in.textureUV);
}
