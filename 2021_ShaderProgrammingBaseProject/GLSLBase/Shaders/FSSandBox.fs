#version 450

layout(location=0) out vec4 FragColor;

varying vec4 v_Color;

const vec3 Circle = vec3(0.5,0.5,0.0);
const float PI = 3.141592;

vec4 CenteredCircle()
{
	float count = 10.0;
	float d = length(v_Color.rgb - Circle);
	float rad = d *4.0*PI*count;
	float greyScale = sin(rad);
	float width = 300.0;
	greyScale= pow(greyScale,width);
	return vec4(greyScale);
}
void main()
{
	/*vec4 color = vec4(0);
	float tempLength = length(v_Color.rgb - Circle);
	if(tempLength <0.5&&tempLength>0.49)
	{
		color =vec4(1,1,1,1);
	}
	else
	{
		color =vec4(0,0,0,0);
	}*/
	FragColor = CenteredCircle();
}