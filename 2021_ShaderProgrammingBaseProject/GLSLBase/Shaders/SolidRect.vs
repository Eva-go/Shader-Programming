#version 450

in vec3 a_Position; //float Position3개
in vec3 a_Velocity; //float velocity3개
in float a_EmitTime; //float emittime 1개

uniform float u_Time;//누적시간

const vec3 c_Gravity = vec3(0,-2.8,0);

void main()
{
	float newTime = u_Time - a_EmitTime;
	newTime = mod(newTime , 2.0);
	vec3 newPos= a_Position;
	
	if(newTime < 0.0)
	{
		newPos = vec3(1000,1000,1000);
	}
	else
	{
		float t = newTime;
		float tt = newTime*newTime;
		newPos = newPos + t * a_Velocity + 0.5 * c_Gravity * tt;
	}
	
	
	
	gl_Position = vec4(newPos, 1);
}
