Shader "Custom/NewTestShader"
{
    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM
            // I'm starting with a simple outline shader with hopes to add noise
            
            #pragma vertex vert
            #pragma fragment frag

			#include "UnityCG.cginc"

            struct AttributesDefault
            {
                float3 vertex : POSITION;
            };

            // VaryingsDefault taken from HLSL std library and modified
            struct VaryingsDefault 
            {
                float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
				float2 texcoordStereo : TEXCOORD1;
				float3 viewSpaceDir : TEXCOORD2;
			#if STEREO_INSTANCING_ENABLED
				uint stereoTargetEyeIndex : SV_RenderTargetArrayIndex;
			#endif
            };

            // the vertex shader of the shader, returns position of vertices in the scene relative to where they need to be
            VaryingsDefault Vert(AttributesDefault v)
            {

            }

            // the fragment shader of the shader
            float4 Frag(Varyings i) : SV_Target
            {

            }

            ENDHLSL
        }
    }
}
