#version 450

in vec3 a_Position; //float Position3��

void main()
{
	gl_Position = vec4(a_Position,1); //OpenGL ���� ��°�
}
