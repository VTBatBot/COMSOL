clear
clc
t = 0:1E-6:0.002;
%time window so that sound travels 10cm
chirp = 2*sin(2*pi*(20000.*(0.002-t)+((120000-20000)/0.002)*(0.002-t).^2));
hann = 0.5*(1-cos(2*pi*t/0.002));
signal = (chirp.*hann);
plot(t,chirp)
figure
plot(t,hann)
figure
plot(t,signal)
xlabel("time (s)")
ylabel("amplitude (Pa)")
title("chirp signal w/Hann window")