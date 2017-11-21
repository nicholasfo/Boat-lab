clear all;
close all;

%Part 3b
T = 72.52;
Td = T;
Kpd = 0.84;
Tf = 8.36;

sim('p5p3c.mdl');
open_system('p5p3c/Compass and rudder')