vout = [1.755 1.677 1.587 1.434 1.054 .923 .813 .357 .135];
rs = [10000 49500 100000 200000 560000 760000 1000000 3300000 9930000];
index = 1;
quantization = 3.3/1024
temp_res = size(vout);

for i=1:8
temp_v1 = vout(1,index);
temp_v2 = vout(1,index+1);
v_dif = temp_v1 - temp_v2;
temp_r1 = rs(1,index);
temp_r2 = rs(1,index+1);
res_dif = temp_r2 - temp_r1;

temp_quant = v_dif/quantization;

resistance = res_dif/temp_quant;
temp_res(1,index) = resistance; 

index = index + 1;
end
temp_res