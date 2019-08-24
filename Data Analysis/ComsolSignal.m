function ComsolSignal(filename,points,Title)

%%ComsolSignal(filename,p)
%
%Reads in a file and uses ComsolIn to extract data from points. Then plots
%the data for the given points, specified by a one-dimensional array in the
%second argument. Enter a title for your graph in the third argument.

[t,p]=ComsolIn('coolstuff.txt');

close 
hold on

for i=1:length(points)
    plot(t,p(:,points(i)))
    xlabel('time (s)');
    ylabel('pressure (Pa)');
    
    if nargin ==2
        title('Signal')
    else
        title(Title)
    end
end
