using System;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

[Serializable]
[PostProcess(typeof(PostProcessCrayonRenderer), PostProcessEvent.BeforeStack, "Third Party/Crayon Post Processing")]
public sealed class ShaderPostProcessing : PostProcessEffectSettings
{
  
}

public sealed class PostProcessCrayonRenderer : PostProcessEffectRenderer<ShaderPostProcessing>
{
    public override void Render(PostProcessRenderContext context)
    {
        // this produces the Shader for the post processing code, gets it by the name it's given
        var sheet = context.propertySheets.Get(Shader.Find("Crayon Shader/Crayon Shader"));
        context.command.BlitFullscreenTriangle(context.source, context.destination, sheet, 0);
    }
}