function [h_ns,t_s,e_s] = test_vectors(in)
% "in" should be pickle_data, the name of the struct holding all the data
% the outputs of the function are heart rate, temp, and eda
% creates 2 text files with stressed and not stressed data
% REMOVE THE LAST BLANK LINE

[hrate, labels, index] = HR(in);

k = find(labels==2);
k2 = index(k);
h_s = dec2bin(8.*fixdata(hrate(k)),11);
t_s = dec2bin(8.*fixdata(in.signal.chest.Temp(k2)),9);
e_s = dec2bin(8.*fixdata(in.signal.chest.EDA(k2)),8);

fileID = fopen('stressed_s17.txt','w');

for n=1:size(h_s)
    fprintf(fileID,'%s\n',t_s(n,:));
    fprintf(fileID,'%s\n',e_s(n,:));
    fprintf(fileID,'%s\n',h_s(n,:));
end
fclose(fileID);

kns = find(labels~=2&labels~=0&labels~=9);
k2ns = index(kns);
h_ns = dec2bin(8.*fixdata(hrate(kns)),11);
t_ns = dec2bin(8.*fixdata(in.signal.chest.Temp(k2ns)),9);
e_ns = dec2bin(8.*fixdata(in.signal.chest.EDA(k2ns)),8);

fileID = fopen('not_stressed.txt_s17','w');

for n=1:size(h_ns)
    fprintf(fileID,'%s\n',t_ns(n,:));
    fprintf(fileID,'%s\n',e_ns(n,:));
    fprintf(fileID,'%s\n',h_ns(n,:));
end
fclose(fileID);


end
