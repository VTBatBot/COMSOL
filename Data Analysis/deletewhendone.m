clear
clc


%this code plots the pressure at exit point in function of time
data=load("");
pressuresAndTimes = data;
[totalRows, lengthData] = size(pressuresAndTimes);
ct=2;
cp=3;


%create time and pressure vectors
for i=3:lengthData
    if mod(i,2)==0
        pressures(1,i-cp)=pressuresAndTimes(1,i);
        cp = cp + 1;
    elseif mod(i,2)==1
        times(1,i-ct)=pressuresAndTimes(1,i);
        ct = ct + 1;
    end
end
ct = 2;
cp = 3;



%plot data
figure
plot(times,pressures)
%msg = 'output point' + num2str(i) + 'data';
title('output point')
xlabel('time')
ylabel('pressure')
hold on

%fourier transfer section
figure
spectrogram(pressures(i,:), 250, 220, 512, 1E6,'yaxis')
