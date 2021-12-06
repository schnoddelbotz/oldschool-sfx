@echo off
echo Test>allscene\test
if not exist allscene\test md allscene
del allscene\test>nul
goto Start
:Start
povray allanim +LPOV3DEMO\ANIM\AMBIENT    AMBIENT    
povray allanim +LPOV3DEMO\ANIM\ATMO       ATMO       
povray allanim +LPOV3DEMO\ANIM\BOING      BOING1     
povray allanim +LPOV3DEMO\ANIM\BOING      GLSBNG     
povray allanim +LPOV3DEMO\ANIM\CAMERA2    CAMERA2    
povray allanim +LPOV3DEMO\ANIM\DIFFUSE    DIFFUSE    
povray allanim +LPOV3DEMO\ANIM\FLOAT1     FLOAT1     
povray allanim +LPOV3DEMO\ANIM\FLOAT2     FLOAT2     
povray allanim +LPOV3DEMO\ANIM\FLOAT3     FLOAT3     
povray allanim +LPOV3DEMO\ANIM\FLOAT4     FLOAT4     
povray allanim +LPOV3DEMO\ANIM\L_O        L_O        
povray allanim +LPOV3DEMO\ANIM\PENTMAP    PENTMAP    
povray allanim +LPOV3DEMO\ANIM\QUILTED    PLOTQLT    
povray allanim +LPOV3DEMO\ANIM\RADDEM     RADDEM     
povray allanim +LPOV3DEMO\ANIM\REFLECT    REFLECT    
povray allanim +LPOV3DEMO\ANIM\SCURVE1    SCURVE     
povray allanim +LPOV3DEMO\ANIM\SCURVE2    SCURVB     
povray allanim +LPOV3DEMO\ANIM\SLINKY     SLNK       
povray allanim +LPOV3DEMO\ANIM\SPECLR     SPECLR     
povray allanim +LPOV3DEMO\ANIM\VECT1      VECT1      
povray allanim +LPOV3DEMO\ANIM\VECT2      VECT2      
povray allanim +LPOV3DEMO\ANIM\WHEEL      WHEEL      
goto End
:End
