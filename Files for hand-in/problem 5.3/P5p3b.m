%Part 3b
T = 72.52;
Td = T;
Kpd = 0.84;
Tf = 8.36;

sim('p5p3b.mdl');
open_system('p5p3b/Compass and rudder')