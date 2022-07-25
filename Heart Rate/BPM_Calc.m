%Read ADC samples
filename = 'ADC Data 2.txt';
M = csvread(filename); %reading pulse sensor adc_data
[row, col] = size(M);
adc_data = M(1:row,1); %isolating data of interest
adc_data = adc_data.'; %transpose (col vector to row vector)
%plot(adc_data(1,80000:90000)); %select range
figure(1);
plot(adc_data) %whole range

resolution_bits = 2^12;
vref = 3.3;
%for plotting ADC values on Y-axis
for i = 1 : row-1
    y(i) = adc_data(i)/((resolution_bits)*vref);
end

%Read time samples
filename = 'Time Data 2.txt';
M = csvread(filename); %reading pulse sensor adc_data
[row, col] = size(M);
time_data = M(1:row,1); %isolating time of interest
time_data = time_data.'; %transpose (col vector to row vector)
%plot(time_data(1,80000:90000)); %select range
figure(2);
plot(time_data) %whole range

global_timer_clk = 333000000; %333MHz
%for plotting time values on Y-axis
for i = 1 : row-1
    x(i) = time_data(i)/(global_timer_clk);
end

%Calculate BPM
[peaks, index] = findpeaks(adc_data, 'MinPeakHeight',3500,'MinPeakDistance',700); %find peak value in adc_data set 
% %hrate(hrate(:,1) > 165 | hrate(:,1) < 40) = []; 
sampling_rate = 1670;
seconds = 60;
BPM = (sampling_rate*seconds)./diff(index) %100200 = 1.67(kHz)*60(seconds per min)

figure(3);
plot(x,y)

%another method of calculating BPM
[peaks, index] = findpeaks(y, x, 'MinPeakHeight',0.2,'MinPeakDistance',0.6); %find peak value in data set
comb_mat = [peaks;index]; %combining matrices:
[row, col] = size(comb_mat);
for i = 1 : col-1
    elapsed_time(i) = index(i+1) - index(i);
    
end

elapsed_time
beats_sec = 1./elapsed_time
BPM = 60./elapsed_time