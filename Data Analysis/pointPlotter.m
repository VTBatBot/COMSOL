%l = input('L : ');
%c = input('c : ');
%d = input('d : ');
%filename = "pointData" + l+ "l" + c + "c" + d + "d.txt";
filename = '4-10.txt';
data=load(filename);
pressuresAndTimes = data(1,:);
lengthData = length(pressuresAndTimes);
ct=2;
cp=3;
for i=3:length(pressuresAndTimes)
    if mod(i,2)==0
        pressures(1,i-cp)=pressuresAndTimes(i);
        cp = cp + 1;
    elseif mod(i,2)==1
        times(1,i-ct)=pressuresAndTimes(i);
        ct = ct + 1;
    end
end
t = 0:1E-7:0.004 ;
chirp = 2*sin(2*pi*(20000.*(t)+((105000-20000)/0.002)*(t).^2));
hann = 0.5*(1-cos(2*pi*t/0.002));
invsignal = (chirp.*hann);
filteredPressures = filtfilt(invsignal, 1, pressures);
figure
plot(times,pressures)
title('Output point data - no filter' + filename)
xlabel('time')
ylabel('pressure')
approxEndOfSignal = 0.0021;
line([approxEndOfSignal approxEndOfSignal], get(gca, 'ylim'), 'Color', 'red');
figure
plot(times, filteredPressures)
title('Output point data - filtered' + filename)
xlabel('time')
ylabel('pressure - filtered')
figure
spectrogram(pressures,120, 100, 512, 1E6,'yaxis')
hold on
line([2.1 2.1], get(gca, 'ylim'), 'Color', 'black');


