clear all;
close all;

T = 72.52;
lambda = 0.0820;
w_0 = 0.7823;
K = 0.1560;
Kw = 0.0049;
Kpd = 0.84;
Tf = 8.36;
T = 72.52;
Td = T;
K = 0.156;

A = [0 1 0 0 0; -w_0^2 -2*lambda*w_0 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
B = [0; 0; 0; K/T; 0];
C = [0 1 1 0 0];
E = [0 0; Kw 0; 0 0; 0 0; 0 1];

%Sample frequency of 10 HZ
timeSample = 1/10;

%From continious to discrete:
[~, Bd] = c2d(A,B,timeSample);
[Ad, Ed] = c2d(A,E,timeSample);
Cd = C;

R = 6.1040*10^(-6);
P_0 = diag([1 0.013 pi^2 1 2.5*10^(-3)]);
Q = diag([30 10^(-6)]);
x_0 = [0; 0; 0; 0; 0];

dataStruct = struct('A', Ad, 'B', Bd, 'C', Cd, 'E', Ed, 'Q', Q, 'R', R, 'P_', P_0, 'x_', x_0);
open('p5p5c.mdl');