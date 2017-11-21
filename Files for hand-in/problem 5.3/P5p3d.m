clear all;
close all;

%Part 3c
T = 72.52;
Td = T;
Kpd = 0.84;
Tf = 8.36;

sim('p5p3d.mdl');
open_system('p5p3d/Compass and rudder')