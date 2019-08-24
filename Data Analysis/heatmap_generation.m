clear
clc
maxL = 15;
maxC = 8;
maxD = 6;
%this code plots the pressure at exit point in function of time.
l = 5;  
fileID = fopen("simulationresults.txt", 'w');
while l <= maxL
    c = 1;
    while c <= maxC
        d = 1;
        while d <= maxD
            filename = "pointData" + l+ "l" + c + "c" + d + "d.txt";
            if exist(filename, 'file')
                data = load(filename);
                pressuresAndTimes = data(1,:);
                lengthData = length(pressuresAndTimes);
                
                %split pressures and times              
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
                
                %cut off pressures where the signal finishes passing
                %through the analyzed point
                timestamp = 2550;
                cutTimes = times(1,timestamp:length(times));
                cutPressures = pressures(1,timestamp:length(pressures));
                for i = 1:length(cutPressures)
                    if cutPressures(1,i) < 0
                        cutPressuresProcessed(1,i) = 0;
                    else
                        cutPressuresProcessed(1,i) = cutPressures(1,i);
                    end
                end
                e = mean(cutPressuresProcessed);
                display(e)
                
                %take positives of entire signal for overall avg amplitude
                %factor
                for i = 1:length(pressures)
                    if pressures(1,i)<0
                        pospressures(1,i) = 0;
                    else
                        pospressures(1,i) = pressures(1,i);
                    end
                end
                
                %take average of signal amplitude
                signalpospressures = pospressures(1,450:timestamp);
                avgAmplitude = mean(pospressures(1,450:length(pospressures)));
                a = mean(signalpospressures);
                
                %display results section-------------------------------
                disp(filename)
                msg = "The echo factor is " + e + " compared to an average signal amplitude of " + a ...
                    + " for a total echo/signal ratio of " + e/a ;
                disp(msg)
                disp("the lower the e/s ratio is, the better");
                fprintf(fileID, "For " + filename + ", " + msg + "\n");
                
                
                %table making section
                if l == 5
                    echoFactors1(c, d) = e/a;
                    avgAmps1(c,d) = avgAmplitude;
                    score1(c,d) = e/a - avgAmplitude;
                end
                if l == 7
                    echoFactors2(c,d) = e/a;
                    avgAmps2(c,d) = avgAmplitude;
                    score2(c,d) = e/a - avgAmplitude;
                end
                if l == 9
                    echoFactors3(c,d) = e/a;
                    avgAmps3(c,d) = avgAmplitude;
                    score3(c,d) = e/a - avgAmplitude;
                end
                if l == 11
                    echoFactors4(c,d) = e/a;
                    avgAmps4(c,d) = avgAmplitude;
                    score4(c,d) = e/a - avgAmplitude;
                end
                if l == 13
                    echoFactors5(c,d) = e/a;
                    avgAmps5(c,d) = avgAmplitude;
                    score5(c,d) = e/a - avgAmplitude;
                end
                if l == 15
                    echoFactors6(c,d) = e/a;
                    avgAmps6(c,d) = avgAmplitude;
                    score6(c,d) = e/a - avgAmplitude;
                end  
            end
            d = d+1;
        end
        c = c + 1;
    end
    l = l+2;
end

%length 5
heatmap(echoFactors1, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 5cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(avgAmps1, 'Colormap', jet)
caxis([0 1])
title('Signal volume (avg) - 5 cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(score1, 'Colormap', jet)
caxis([0 3])
title('score - 5 cm length')
ylabel('convexity')
xlabel('eccentricity')

%length 7 
figure
heatmap(echoFactors2, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 7cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(avgAmps2, 'Colormap', jet)
caxis([0 1])
title('signal volume - 7 cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(score2, 'Colormap', jet)
caxis([0 3])
title('score - 7 cm length')
ylabel('convexity')
xlabel('eccentricity') 

%9cm length
figure
heatmap(echoFactors3, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 9cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(avgAmps3, 'Colormap', jet)
caxis([0 1])
title('Average volumes - 9 cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(score3, 'Colormap', jet)
caxis([0 3])
title('score - 9 cm length')
ylabel('convexity')
xlabel('eccentricity') 

%11 cm length
figure
heatmap(echoFactors4, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 11cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(avgAmps4, 'Colormap', jet)
caxis([0 1])
title('Average volume - 11cm length')
ylabel('convexity')
xlabel('eccentricity') 
figure
heatmap(score4, 'Colormap', jet)
caxis([0 3])
title('score - 11m length')
ylabel('convexity')
xlabel('eccentricity') 

%length 13
heatmap(echoFactors5, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 13cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(avgAmps5, 'Colormap', jet)
caxis([0 1])
title('Signal volume (avg) - 13 cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(score5, 'Colormap', jet)
caxis([0 3])
title('score - 13 cm length')
ylabel('convexity')
xlabel('eccentricity')

%length 15
heatmap(echoFactors6, 'Colormap', jet)
caxis([0.8 3.5])
title('Color map of echo/signal ratio (lower = better) -- 15cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(avgAmps6, 'Colormap', jet)
caxis([0 1])
title('Signal volume (avg) - 15cm length')
ylabel('convexity')
xlabel('eccentricity')
figure
heatmap(score6, 'Colormap', jet)
caxis([0 3])
title('score - 15 cm length')
ylabel('convexity')
xlabel('eccentricity')
