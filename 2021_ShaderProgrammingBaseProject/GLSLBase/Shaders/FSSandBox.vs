#version 450

in vec3 a_Position; //float Position3��

varying vec4 v_Color;

void main()
{
	gl_Position = vec4(a_Position,1); //OpenGL ���� ��°�
	v_Color = vec4(a_Position.x+0.5,a_Position.y+0.5,0,0);
}