#version 450

layout(location=0) out vec4 FragColor;

//uniform vec4 u_Color;

in vec4 v_Color;

void main()
{
	//FragColor = vec4(1,0,0,1);
	FragColor = v_Color;
}
