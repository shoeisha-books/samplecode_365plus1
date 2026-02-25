struct Vertex_In
{
    float4 position: POSITION;
    float2 textureUV: TEXCOORD;
};

struct Vertex_Out
{
    __init(float4 pos, float2 uv)
    {
        position = pos;
        textureUV = uv;
    }
    float4 position: SV_POSITION;
    float2 textureUV: TEXCOORD;
};

ConstantBuffer<float4x4> mvp;
Sampler2D tex;

[shader("vertex")]
func vertMain(Vertex_In in) -> Vertex_Out
{
    return Vertex_Out(mul(in.position, mvp), in.textureUV);
}

[shader("fragment")]
func fragMain(Vertex_Out in) -> float4
{
    return tex.Sample(in.textureUV);
}
