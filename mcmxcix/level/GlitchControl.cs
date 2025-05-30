using Godot;
using System;

public partial class GlitchControl : ColorRect
{
    [Export] public float MaxGlitchStrength = 0.05f;
    [Export] public float GlitchInterval = 0.05f;
    private ShaderMaterial _material;
    private float _timer;

    public override void _Ready()
    {
        _material = (ShaderMaterial)Material;
    }
    public override void _Process(double delta)
    {
        _timer += (float)delta;
        if (_timer > GlitchInterval)
        {
            var rnd = new RandomNumberGenerator();
            rnd.Randomize();

            _material.SetShaderParameter("rbg_split_amount", rnd.Randf() * MaxGlitchStrength);
            _material.SetShaderParameter("distortion_strength", rnd.Randf() * MaxGlitchStrength);
            _timer = 0;
        }
    }
}