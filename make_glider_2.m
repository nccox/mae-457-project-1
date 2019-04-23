clear
clc

chord = 3*0.0254;
x_t_le = 7*0.0254;
z_t_le = -0.25*0.0254;
c_t_r = 2*0.0254;
c_t_t = 1*0.0254;
b_t = 4*0.0254;
%elev_width = 
elev_c = 0.75*0.0254;
taper_start = 0.5*0.0254;

fprintf("#===============================================================\n")
fprintf("SURFACE\n")
fprintf("Horizontal Stabilizer\n")
fprintf("#Nchordwise  Cspace   Nspanwise   Sspace\n")
fprintf("10           1.0      10          0.0\n#\n")
fprintf("YDUPLICATE\n0.0\n#\nTRANSLATE\n0.0 0.0 0.0\n#\nANGLE\n0.0\n")
fprintf("#-------------------------------------------------------------\n")
fprintf("SECTION\n")
fprintf("#Xle    Yle     Zle     Chord   Ainc  Nspanwise  Sspace\n")
fprintf("%.9f  	%.9f       %.9f       %.9f    0    0          0\n\n",...
    x_t_le, 0, z_t_le, c_t_r)
fprintf("NACA\n0001\n\n")
fprintf("#Cname   Cgain  Xhinge  HingeVec     SgnDup\n")
fprintf("CONTROL\n")
fprintf("elevator 1.0    %.6f     0.0 0.0 0.0  1.0\n",elev_c/c_t_r)
fprintf("#\n")
fprintf("#-------------------------------------------------------------\n")
fprintf("SECTION\n")
fprintf("#Xle    Yle     Zle     Chord   Ainc  Nspanwise  Sspace\n")
fprintf("%.9f  	%.9f       %.9f       %.9f    0    0          0\n\n",...
    x_t_le, taper_start, z_t_le, c_t_r)
fprintf("NACA\n0001\n\n")
fprintf("#Cname   Cgain  Xhinge  HingeVec     SgnDup\n")
fprintf("CONTROL\n")
fprintf("elevator 1.0    %.6f     0.0 0.0 0.0  1.0\n",elev_c/c_t_r)
fprintf("#\n")
fprintf("#-------------------------------------------------------------\n")
fprintf("SECTION\n")
fprintf("#Xle    Yle     Zle     Chord   Ainc  Nspanwise  Sspace\n")
fprintf("%.9f  	%.9f       %.9f       %.9f    0    0          0\n\n",...
    x_t_le + c_t_r - c_t_t, b_t/2, z_t_le, c_t_t)
fprintf("NACA\n0001\n\n")
fprintf("#Cname   Cgain  Xhinge  HingeVec     SgnDup\n")
fprintf("CONTROL\n")
fprintf("elevator 1.0    %.6f     0.0 0.0 0.0  1.0\n",elev_c/c_t_t)
fprintf("#\n")