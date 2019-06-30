//http://www.geeks3d.com/20091027/shader-library-posterization-post-processing-effect-glsl/
//http://irrlicht.sourceforge.net/forum/viewtopic.php?f=9&t=45531

//Customization Zone
const int aspectx = 19;//Your aspect ratio's X value.
const int aspecty = 9;//Your aspect ratio's Y value.

//Code Zone
uniform sampler2D Texture;

vec4 pixelate(sampler2D tex, vec2 uv)
{
vec2 coord = vec2( (ceil(uv.x * ((240*pixelcount)*(aspectx/aspecty))) / ((240*pixelcount)*(aspectx/aspecty))),
ceil(uv.y * (200*pixelcount)) / (200*pixelcount));
return texture2D(tex, coord);
}

void main() 
{
	if ( enablepixelate == 1 )
	{
		if ( enableposterization == 1 )
		{
			vec4 c = pixelate(Texture, TexCoord);
			c = pow(c, vec4(gamma, gamma, gamma, 1));
			c = c * posterization;
			c = floor(c);
			c = c / posterization;
			c = pow(c, vec4(1.0/gamma));
			FragColor = vec4(c);
		}
		if ( enableposterization == 0 )
		{
			FragColor = pixelate(Texture, TexCoord);
		}
	}
	if ( enablepixelate == 0 )
	{
		vec4 c = texture2D(Texture, TexCoord.xy);
		c = pow(c, vec4(gamma, gamma, gamma, 1));
		c = c * posterization;
		c = floor(c);
		c = c / posterization;
		c = pow(c, vec4(1.0/gamma));
		FragColor = vec4(c);
	}
}