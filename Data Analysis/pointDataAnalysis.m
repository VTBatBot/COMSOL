clear
clc


%this code plots the pressure at exit point in function of time
data=load("pointData5l2c2d.txt");
pressuresAndTimes = data(1,:);
lengthData = length(pressuresAndTimes);
ct=2;
cp=3;


%create time and pressure vectors
for i=3:length(pressuresAndTimes)
    if mod(i,2)==0
        pressures(1,i-cp)=pressuresAndTimes(i);
        cp = cp + 1;
    elseif mod(i,2)==1
        times(1,i-ct)=pressuresAndTimes(i);
        ct = ct + 1;
    end
    
end
%remove all negative pressures
%for i=1:length(pressures)
%    if pressures(1,i) < 0
%        pressures(1,i)=0;
%    end
%end

intervalBound = 0.01;

%cut data to remove some noise
for i = 1:length(times)
    if times(1,i) == intervalBound
        timestamp = i;
    end
end
for i = 1:timestamp
    cutPressures(1,i) = pressures(1,i);
end
for i = 1:timestamp
    cutTimes(1,i) = times(1,i);
end

%plot data
figure
plot(cutTimes,cutPressures)
title('Output point data')
xlabel('time')
ylabel('pressure')
hold on

%perform analysis
averagePressure = mean(cutPressures);
refline(1,averagePressure)
hline = refline([0 averagePressure]);
hline.Color = 'r';
display(averagePressure)
approxEndOfSignal = 0.0032;
line([approxEndOfSignal approxEndOfSignal], get(gca, 'ylim'), 'Color', 'green');
maxPressure = max(cutPressures);
display(maxPressure)
for i=1:length(cutPressures)
    if cutPressures(1,i) == maxPressure
        maxTime = cutTimes(1,i);
    end
end
line([maxTime maxTime], get(gca, 'ylim'),'Color', 'black');

%fourier transfer section
figure
spectrogram(pressures,250, 220, 512, 1E6,'yaxis')
