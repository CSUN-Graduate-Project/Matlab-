function [t_s, b_s, t_ns, b_ns, ...
          e_s, b_e_s, e_ns, b_e_ns, ...
          h_s, b_h_s, h_ns, b_h_ns] ...
          = preprocess_last(pickle_data_s2, pickle_data_s3)
      
%function combines 2 structs to output probabilites
                         
[data_temp_s2,freq_temp_s2,data_temp_ns2,freq_temp_ns2,... temp
          data_eda_s2, freq_eda_s2, data_eda_ns2, freq_eda_ns2,... eda
          data_hr_s2, freq_hr_s2, data_hr_ns2, freq_hr_ns2] = preprocess2(pickle_data_s2);                         
                         
[data_temp_s3,freq_temp_s3,data_temp_ns3,freq_temp_ns3,... temp
          data_eda_s3, freq_eda_s3, data_eda_ns3, freq_eda_ns3,... eda
          data_hr_s3, freq_hr_s3, data_hr_ns3, freq_hr_ns3] = preprocess2(pickle_data_s3);
% ----------------------------------------------------------------------------------------

temp_s = combine_rows(data_temp_s2, freq_temp_s2,data_temp_s3, freq_temp_s3);

temp_ns = combine_rows(data_temp_ns2, freq_temp_ns2,data_temp_ns3, freq_temp_ns3);

% find optimal pad value
pad_t_s = round(sum(temp_s(:, [2]))/10000);
pad_t_ns = round(sum(temp_ns(:, [2]))/10000);

% pad frequencies
temp_s(:, [2]) = temp_s(:, [2]) + pad_t_s;
temp_ns(:, [2]) = temp_ns(:, [2]) + pad_t_ns;

% obtain scaled probablities
p_s = round(temp_s(:, [2])*(10000/sum(temp_s(:, [2]))));
p_ns = round(temp_ns(:, [2])*(10000/sum(temp_ns(:, [2]))));

% obtain binary representation of probabilities
b_s = dec2bin(p_s);
b_ns = dec2bin(p_ns);

t_s = dec2bin(temp_s(:, [1]).*8);
t_ns = dec2bin(temp_ns(:, [1]).*8);

% ----------------------------------------------------------------------------------------

eda_s = combine_rows(data_eda_s2, freq_eda_s2,data_eda_s3, freq_eda_s3);

eda_ns = combine_rows(data_eda_ns2, freq_eda_ns2,data_eda_ns3, freq_eda_ns3);

% find optimal pad value
pad_e_s = round(sum(eda_s(:, [2]))/10000);
pad_e_ns = round(sum(eda_ns(:, [2]))/10000);

% pad frequencies
eda_s(:, [2]) = eda_s(:, [2]) + pad_e_s;
eda_ns(:, [2]) = eda_ns(:, [2]) + pad_e_ns;

% obtain scaled probablities
p_e_s = round(eda_s(:, [2])*(10000/sum(eda_s(:, [2]))));
p_e_ns = round(eda_ns(:, [2])*(10000/sum(eda_ns(:, [2]))));

% obtain binary representation of probabilities
b_e_s = dec2bin(p_e_s);
b_e_ns = dec2bin(p_e_ns);

e_s = dec2bin(eda_s(:, [1]).*8);
e_ns = dec2bin(eda_ns(:, [1]).*8);


% ----------------------------------------------------------------------------------------

hr_s = combine_rows(data_hr_s2, freq_hr_s2,data_hr_s3, freq_hr_s3);

hr_ns = combine_rows(data_hr_ns2, freq_hr_ns2,data_hr_ns3, freq_hr_ns3);

% find optimal pad value
pad_h_s = round(sum(hr_s(:, [2]))/10000);
pad_h_ns = round(sum(hr_ns(:, [2]))/10000);

% pad frequencies
hr_s(:, [2]) = hr_s(:, [2]) + pad_h_s;
hr_ns(:, [2]) = hr_ns(:, [2]) + pad_h_ns;

% obtain scaled probablities
p_h_s = round(hr_s(:, [2])*(10000/sum(hr_s(:, [2]))));
p_h_ns = round(hr_ns(:, [2])*(10000/sum(hr_ns(:, [2]))));

% obtain binary representation of probabilities
b_h_s = dec2bin(p_h_s);
b_h_ns = dec2bin(p_h_ns);

h_s = dec2bin(hr_s(:, [1]).*8);
h_ns = dec2bin(hr_ns(:, [1]).*8);

end
