
%Part 2a

fs = 10/360;%in deg/s
window = 4096;
x = psi_w(2,:);
noverlap = [];
nfft = [];

[pxx,f] = pwelch(x,window,noverlap,nfft,fs);

pxx_rad=pxx*(pi/180); %from power s/deg to power s/rad
f_rad=f/(pi/180); %from deg/s to rad/sec

%Part 2b


