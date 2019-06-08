void main()
{
	vec3 color = texture(InputTexture, TexCoord).rgb;
	
	vec3 vignetteColor = -color + vignetteColor;
	
	float vignetteWeight = dot(pow(color,vec3(2.2)), vignetteWeights);
	
	vignetteWeight = clamp(1.0 - vignetteWeight, 0.0, 1.0);
	
	vignetteWeight *= vignetteOpacity;
	
	float vignetteMask = texture(texVignette, TexCoord).x * vignetteScale;
	
	float invVignetteMask = clamp(vignetteWeight * vignetteMask, 0.0, 1.0);
	
	//vec3 test = vec3(1.0 - invVignetteMask);
	
	vec3 finalColor = vignetteColor * invVignetteMask + color;
	
	FragColor = vec4(finalColor,1.0);
}