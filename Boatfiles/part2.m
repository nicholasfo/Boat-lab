
%Part 2a
load('C:\Users\nicholao\Downloads\Boatfiles\wave.mat')
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






