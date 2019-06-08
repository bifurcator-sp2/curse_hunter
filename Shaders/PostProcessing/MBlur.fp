
void main()
{
	vec4 C; // = texture( InputTexture, TexCoord)
	
	for(int i = 0; i < nSamples ; ++i)
	{
		vec2 offset = blurVec * (float(i) / float(nSamples  - 1) - 0.5);
	
		C.rgb += texture( InputTexture, TexCoord + offset ).rgb;
	}
	
	C /= float(nSamples );
	
	FragColor = C;
}
