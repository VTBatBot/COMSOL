%planedataanimator
%this script animates the data from a comsol cutplane and analyzes it,
%outputting a multidirectionality factor and a dispersion gradient

filename = 'filename';
data = load(filename);

%plane interpreting
step = 1E-6;
endtime = 0.015;
%step = input('what is the time step?');
%endtime = input('what is the end time');
[totalRows, totalColumns] = size(data);
x = data(:,1);
y = data(:,2);
nTimes = totalColumns-3;
times = 0:step:endtime;
pressures = zeros([totalRows length(times)]);
for i = 1:length(nTimes)-4
     dataRow = 4 + i;
     pressures(:,i) = data(:,dataRow);
end

%begin movie making
loops = 15001;
F(loops) = struct('cdata', [], 'colormap', []);
for j=1:loops
    pdata = pressures(:,j);
    plot3(x,y,pdata)
    drawnow
    F(j) = getframe(gcf);
end
%movie made

%compute multidirectionality factors

