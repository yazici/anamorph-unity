// VacuumShaders 2014
// https://www.facebook.com/VacuumShaders

Shader "VacuumShaders/Fragmentum/Demo/Car Diffuse"
{
	Properties 
	{
		[HideInInspector]
		_Color ("", Color) = (1,1,1,1)
		[HideInInspector]
		_MainTex ("", 2D) = "white" {}	   
		   

  
		[HideInInspector]
		V_FR_FragTexture("", 2D) = "white"{}	
		[HideInInspector]
		V_FR_FragTexturePower("", Range(1, 10)) = 1
		              
		            
		[HideInInspector]   
		V_FR_Fragmentum("", Range(0, 1)) = 0.5
		[HideInInspector]
		V_FR_DisplaceAmount("", float) = 1	 
		[HideInInspector]     
		V_FR_RotateSpeed("", float) = 1    
		[HideInInspector]
		V_FR_DisplaceDirectionObjectPosition("", vector) = (0, 1, 0, 0)
		[HideInInspector]  
		V_FR_FragmentsScale("", float) = 1  
		     
		[HideInInspector]   
		V_FR_DistanceToActivator("", float) = 0
		   
 		[HideInInspector]   
		V_FR_FragTexture("", 2D) = "white"{}		
		[HideInInspector] 
		V_FR_FragTexturePower("", Range(1, 10)) = 1
		     		      
		[HideInInspector] 
		V_FR_RandomizeFragmentum("", float) = 0   
		[HideInInspector]
	 	V_FR_RandomizeFragmentsScale("", float) = 0 
		[HideInInspector]
		V_FR_RandomizeDistanceToActivator("", float) = 0 
		[HideInInspector] 
		V_FR_RandomizeInitialRotation("", float) = 0
		[HideInInspector] 
		V_FR_RandomizeRotationSpeed("", float) = 0
		[HideInInspector]
		V_FR_RandomizeRotationTimeOffset("", float) = 0
		[HideInInspector]   
		V_FR_RandomizeDisplaceDirection("", Range(0, 1)) = 0
		[HideInInspector]   
		V_FR_RandomizeDisplaceAmount("", float) = 0  		
	} 
	  
	SubShader   
	{
		Tags { "Queue"="Geometry" "RenderType"="Opaque" "FragmentumTag"="Fragmentum/SM3/Unity Surface Shader/Diffuse"}
		LOD 200 

//DO NOT MODIFY !!! Cull		
Cull Off
		     
		CGPROGRAM    
		#pragma surface surf Lambert vertex:vert addshadow fullforwardshadows
		#pragma target 3.0 
		#pragma glsl   
		#pragma exclude_renderers flash gles xbox360 ps3

		#pragma multi_compile V_FR_EDITOR_ON V_FR_EDITOR_OFF 	
						 
		     
//DO NOT MODIFY !!! Defines
#define V_FR_FRAGMENTS_SCALE
#define V_FR_ACTIVATOR_PLANE
#define V_FR_RANDOMIZE_SCALE
#define V_FR_RANDOMIZE_INITIAL_ROTATION
#define V_FR_RANDOMIZE_DISPLACE_DIRECTION



		  
		#define V_FR_SURFACE  
		#define V_FR_FRAGMENT_TEXTURE_ON

		#include "../cginc/FragmentumCG_MOBILE.cginc"
		
		
		void surf (Input IN, inout SurfaceOutput o) 
		{
			half4 c = tex2D (_MainTex, IN.uv_MainTex);

			#ifdef V_FR_MAIN_COLOR
			    c *= _Color;
			#endif

			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}	
		

		ENDCG
	} 

	CustomEditor "FragmentumMaterial_Editor"
	FallBack "Diffuse"
}
