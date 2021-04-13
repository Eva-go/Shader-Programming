#version 450

in vec3 a_Position; //float Position3개
in vec3 a_Velocity; //float velocity3개
in float a_EmitTime; //float emittime 1개
in float a_LifeTime; //float lifetime 1개

in float a_P; //float Period 1개
in float a_A; //float Amp 1개

in float a_RandValue;//float Value 1개
uniform float u_Time;//누적시간

const vec3 c_Gravity = vec3(0,-2.8,0);
//const vec3 c_Gravity = vec3(0,0,0);
const mat3 c_NV = mat3(0,-1,0,1,0,0,0,0,0);
void main()
{
	float newTime = u_Time - a_EmitTime;

	
	//vec3 newPos= a_Position;
	vec3 newPos;
	newPos.x = a_Position.x+cos(a_RandValue*2*3.14);
	newPos.y = a_Position.y+sin(a_RandValue*2*3.14);

	newPos.x = a_Position.x+(16*pow(sin(a_RandValue* 2 * 3.14),3))*0.04;
	newPos.y = a_Position.y+(13*cos(a_RandValue* 2 * 3.14) - 5*cos(2*a_RandValue* 2 * 3.14) - 2*cos(3*a_RandValue* 2 * 3.14)
				- cos(4*a_RandValue* 2 * 3.14))*0.04;
	if(newTime < 0.0)
	{
		newPos = vec3(1000,1000,1000);
	}
	else
	{
		/*newTime = mod(newTime , a_LifeTime);
		newPos=newPos+vec3(newTime,0,0);
		newPos.y=newPos.y + (a_A*newTime) * sin(newTime*3.14*2*a_P);*/
		
		newTime = mod(newTime , a_LifeTime);
		float t = newTime;
		float tt = newTime*newTime;
		vec3 currVel = a_Velocity + t * c_Gravity;
		vec3 normalV = normalize(currVel * c_NV);
		newPos = newPos + t * a_Velocity + 0.5 * c_Gravity * tt;
		newPos = newPos + normalV * a_A * sin(newTime*2*3.14*a_P);
	}
	
	
	
	gl_Position = vec4(newPos, 1);
}
