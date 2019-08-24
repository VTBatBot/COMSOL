% comsol plane data in
%
clear
clc
% This code assembles plane data into something useable.
% IHateMATLAB();
%
%filename = input('input the filename','s');
filename = "planeData5l1c1d.txt";
step = 1E-6;
endtime = 0.009;
%step = input('what is the time step?');
%endtime = input('what is the end time');
data = load(filename);
[totalRows, totalColumns] = size(data);
x = data(:,1);
y = data(:,2);
nTimes = totalColumns-3;
times = 0:step:endtime;
pressures = zeros([totalRows length(times)]);
for i = 1:length(times)-4
     dataRow = 4 + i;
     pressures(:,i) = data(:,dataRow);
end
for i=1:totalRows
    plot(times,pressures(i,:))
    hold on
end
%select zone in front of exit
%plot3 data from exit zone
%compute 'multidirectionality' factor
%display data
%end
