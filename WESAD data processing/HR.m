function [hrate, labels, index] = HR(in)

% find peaks for IBI calculation
[peak, index] = findpeaks(in.signal.chest.ECG,'MinPeakHeight',.8,'MinPeakDistance',15);

% Calculate heart rate
hrate = 42000./diff(index);

% create column vector of labels
labels = in.label(index).';

[i,j] = size(hrate);

% this for loop finds invalid HR values and changes its label
for n=1:i
    if hrate(n) > 255
        labels(n) = 9;
    end
end

end
