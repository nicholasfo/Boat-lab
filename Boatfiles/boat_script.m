
%Part 2a
load('wave.mat')
x = psi_w(2,:)*pi/180;
window = 4096;
noverlap = [];
nfft = [];  
fs = 10;

% Power Spectral Density (PSD) function
[pxx,f] = pwelch(x, window, noverlap, nfft , fs); 

%Scaling to s/rad & rad/s
pxx = pxx/(2*pi);
f = f*2*pi;


%Part 2b

%Part 2c
xmax = find(max(pxx) == pxx);
w_0 = f(xmax);

%Part 2d
clf;
lambda = 0.082;
w = linspace(0,2,1000);
sigma = sqrt(max(pxx));
Kw = 2*lambda*w_0*sigma;
Pw = (Kw^2.*w.^2)./(w.^4+(4*lambda^2-2).*w.^2*w_0^2+w_0^4);
plot(w,Pw);
axis([0 2 -0.00005 16*10^(-4)])
hold on;
plot(f,pxx);
legend Analytic Estimate

%Part 3a
clf;
s=tf('s');
T = 72.52;
Td = T;
K = 0.156;

Kpd = 0.84;
Tf = 8.36;

h_pd=Kpd*(Td*s+1)/(Tf*s+1);
h_s=K/(s*(T*s+1));
h=h_pd*h_s;
[Gm, Pm] = margin(h);
margin(h);

%Part 5a
A = [0 1 0 0 0; -(w_0)^2 -2*lambda*w_0 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
B = [0; 0; 0; K/T; 0];
C = [0 1 1 0 0];
E = [0 0; Kw 0; 0 0; 0 0; 0 1];

%Sample frequency of 10 HZ
timeSample = 1/10;

%From continious to discrete:
[Ad, Bd] = c2d(A,B,timeSample);
[Ad, Ed] = c2d(A,E,timeSample);
Cd = C;

%Part 5b
%Measures in radians from compass
R = var(measNoise);
Rd = R/timeSample;


%Part 5c - Kalman Filter
P_0 = diag([1 0.013 pi^2 1 2.5*10^(-3)]);
Q = diag([30 10^(-6)]);
x_0 = [0; 0; 0; 0; 0];

dataStruct = struct('Ad', Ad, 'Bd', Bd, 'Cd', Cd, 'Ed', Ed, 'Q', Q, 'R', R, 'P_0', P_0, 'x_0', x_0);












