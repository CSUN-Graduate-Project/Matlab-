function [data_temp_s,freq_temp_s,data_temp_ns,freq_temp_ns,... temp
          data_eda_s, freq_eda_s, data_eda_ns, freq_eda_ns,... eda
          data_hr_s, freq_hr_s, data_hr_ns, freq_hr_ns]... heart rate
          = preprocess2(in)
      
% input should be pickle_data
% output is data followed by probability in binary
% temp, eda, hr in that order
% stressed comes before not stressed

% -------------------------------------------------------------------------
% Temperature

% k and kns are indexes
% 2 = stressed, 0 = junk value, everything else is not stressed
k = find(in(1).label==2);
kns = find(in(1).label~=2 & in.label~=0);

%k2 = find(in(2).label==2);
%kns2 = find(in(2).label~=2 & in.label~=0);

% fix the data, round to nearest .125
fixed = fixdata(in(1).signal.chest.Temp);
%fixed2 = fixdata(in(2).signal.chest.Temp);

temp_s = fixed(k);
temp_ns = fixed(kns); %#ok<*FNDSB>

%temp_s2 = fixed(k2);
%temp_ns2 = fixed(kns2); %#ok<*FNDSB>

% obtain frequencies
[freq_temp_s, data_temp_s] = groupcounts(temp_s);
[freq_temp_ns, data_temp_ns] = groupcounts(temp_ns);

%[freq_temp_s, data_temp_s] = groupcounts(temp_s);
%[freq_temp_ns2, data_temp_ns2] = groupcounts(temp_ns2);

% remove any 0s from the data
if data_temp_s(1) <= 0
    data_temp_s([1],:) = [];
    freq_temp_s([1],:) = [];
end

if data_temp_ns(1) <= 0
    data_temp_ns([1],:) = [];
    freq_temp_ns([1],:) = [];
end

% find optimal pad value
pad_t_s = round(sum(freq_temp_s)/10000);
pad_t_ns = round(sum(freq_temp_ns)/10000);

% pad frequencies
freq_temp_s = freq_temp_s + pad_t_s;
freq_temp_ns = freq_temp_ns + pad_t_ns;

% obtain scaled probablities
p_s = round(freq_temp_s*(10000/sum(freq_temp_s)));
p_ns = round(freq_temp_ns*(10000/sum(freq_temp_ns)));

% obtain binary representation of probabilities
b_s = dec2bin(p_s);
b_ns = dec2bin(p_ns);

% -------------------------------------------------------------------------
% EDA
% reuse k values

% fix the data, round to nearest .125
fixed_eda = fixdata(in.signal.chest.EDA);

eda_s = fixed_eda(k);
eda_ns = fixed_eda(kns); %#ok<*FNDSB>

% obtain frequencies
[freq_eda_s, data_eda_s] = groupcounts(eda_s);
[freq_eda_ns, data_eda_ns] = groupcounts(eda_ns);

% remove any 0s from the data
if data_eda_s(1) <= 0
    data_eda_s([1],:) = [];
    freq_eda_s([1],:) = [];
end

if data_eda_ns(1) <= 0
    data_eda_ns([1],:) = [];
    freq_eda_ns([1],:) = [];
end

% find optimal pad value
pad_e_s = round(sum(freq_eda_s)/10000);
pad_e_ns = round(sum(freq_eda_ns)/10000);

% pad frequencies
freq_eda_s = freq_eda_s + pad_e_s;
freq_eda_ns = freq_eda_ns + pad_e_ns;

% obtain scaled probablities
p_e_s = round(freq_eda_s*(10000/sum(freq_eda_s)));
p_e_ns = round(freq_eda_ns*(10000/sum(freq_eda_ns)));

% obtain binary representation of probabilities
b_e_s = dec2bin(p_e_s);
b_e_ns = dec2bin(p_e_ns);

% -------------------------------------------------------------------------
% Heart rate
% 
[hrate, labels] = HR(in);
k_hr = find(labels==2);
kns_hr = find(labels~=2 & labels~=0);

% fix the data, round to nearest .125
fixed_hr = fixdata(hrate);

hr_s = fixed_hr(k_hr);
hr_ns = fixed_hr(kns_hr); %#ok<*FNDSB>

% obtain frequencies
[freq_hr_s, data_hr_s] = groupcounts(hr_s);
[freq_hr_ns, data_hr_ns] = groupcounts(hr_ns);

% remove any 0s from the data
if data_hr_s(1) <= 0
    data_hr_s([1],:) = [];
    freq_hr_s([1],:) = [];
end

if data_hr_ns(1) <= 0
    data_hr_ns([1],:) = [];
    freq_hr_ns([1],:) = [];
end

% find optimal pad value
pad_hr_s = round(sum(freq_hr_s)/10000);
pad_hr_ns = round(sum(freq_hr_ns)/10000);

% pad frequencies
freq_hr_s = freq_hr_s + pad_hr_s;
freq_hr_ns = freq_hr_ns + pad_hr_ns;

% obtain scaled probablities
p_hr_s = round(freq_hr_s*(10000/sum(freq_hr_s)));
p_hr_ns = round(freq_hr_ns*(10000/sum(freq_hr_ns)));

% obtain binary representation of probabilities
b_hr_s = dec2bin(p_hr_s);
b_hr_ns = dec2bin(p_hr_ns);

end