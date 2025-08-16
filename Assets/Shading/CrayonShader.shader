Shader "CrayonShader/CrayonShader"
{
    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM
            // I'm starting with a simple outline shader with hopes to add noise
            // Next step of the project is to make a volume component and add variables
            
            #pragma vertex vert
            #pragma fragment frag

			#include "Packages/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"

            TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
			// _CameraNormalsTexture contains the view space normals transformed to be in 0-1
			TEXTURE2D_SAMPLER2D(_CameraNormalsTexture, sampler_CameraNormalsTexture);
			TEXTURE2D_SAMPLER2D(_CameraDepthTexture, sampler_CameraDepthTexture);

            float4 _MainTex_TexelSize;

			float _Scale;

            // works as a threshold for measuring the depth of an object
			float _DepthThreshold;
			float _DepthNormalThreshold;
			float _DepthNormalThresholdScale;

			float _NormalThreshold;

			// This matrix is populated in ShaderPostProcessing
			float4x4 _ClipToView;

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
                // the final VaryingsDefault returned by the function
                VaryingsDefault finalVert;
            }

            // the fragment shader of the shader
            float4 Frag(Varyings i) : SV_Target
            {

            }

            ENDHLSL
        }
    }
}
