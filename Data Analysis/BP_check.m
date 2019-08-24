data = double(sonarTest.data.xdata);
sz = size(data);

ff = design(fdesign.bandpass('N,Fc1,Fc2',512, 20/250, 80/250));

fdata = zeros(size(data));
for k = 1: sz(4)
    for j = 1: sz(3)
        for i = 1: sz(2)
            fdata(:,i,j,k) = filtfilt(ff.Numerator,1,data(:,i,j,k));
            fdata(:,i,j,k) = abs(hilbert(fdata(:,i,j,k)));
        end
    end
    figure;
    plotData = squeeze(mean(mag2db(fdata(:,:,:,k)),2));
    imagesc(plotData);
    title (sprintf('Elevation: %d',el(k)));
end
