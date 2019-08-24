%filename = input('input the filename','s');
filename = "planeData5l2c3d.txt";
step = 1E-6;
endtime = 0.12;
data = load(filename);
[totalRows, totalColumns] = size(data);
x = data(:,1);
y = data(:,2);
%nTimes = (totalColumns-3)/2;
times = 0:step:endtime;
pressures = zeros([totalRows length(times)]);
t = 0;
idx = 1;
while idx <= (totalColumns-4)
     dataRow = 4 + idx;
     pressures(:,idx) = data(:,dataRow);
     idx = idx + 2;
end
%pdata = pressures(:,755);
%plot3(x,y,pdata)
[cX,cY] = meshgrid(x,y);
cV = griddata(x, y, pdata, cX, cY);
mesh(cX, cY, cV)