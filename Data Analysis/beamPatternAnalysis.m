filename = "Data_5majR5minr.txt";
data = load(filename);
[totalPoints, totalColumns] = size(data);
nPressures = totalColumns;
x = data(1 , :);
y = data(2 , :);

pressures = zeros(totalPoints, nPressures);
j = 1;
row = 1;
for rows = 1:totalPoints
    for i = 3:totalColumns
        if mod(i, 2) ==  1
            j = j + 1;
            pressures(row, j) = data(row, i);
        end
    end
    row = row + 1; 
    j = 1;
end
theta = 0:0.1:3.14;
%figure

%polarplot(theta,pressures);

%%

[pRows, pColumns] = size(pressures);

for k=1:pRows
   Amp(k, :) = rms(pressures(k, :));
end

%%

figure
polarplot(theta, Amp)
title(filename + ' beam pattern XY plane')
