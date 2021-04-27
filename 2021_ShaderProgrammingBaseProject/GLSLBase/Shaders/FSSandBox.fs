#version 450

layout(location=0) out vec4 FragColor;

varying vec4 v_Color;

void main()
{
	FragColor = v_Color;
}