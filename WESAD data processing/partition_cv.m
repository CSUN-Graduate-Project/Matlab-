function [part, idx1, idx2, idx3, idx4, idx5, idx6, idx7, idx8, idx9, idx10] = partition_cv(...
            pickle_data_s2, pickle_data_s3, ...
            pickle_data_s4, pickle_data_s5, ...
            pickle_data_s6, pickle_data_s7, ...
            pickle_data_s10, pickle_data_s11, ...
            pickle_data_s13, pickle_data_s14, ...
            pickle_data_s15, pickle_data_s16, ...
            pickle_data_s17, pickle_data_s8)

k2 = find(pickle_data_s2.label~=0);
k3 = find(pickle_data_s3.label~=0);
k4 = find(pickle_data_s4.label~=0);
k5 = find(pickle_data_s5.label~=0);
k6 = find(pickle_data_s6.label~=0);
k7 = find(pickle_data_s7.label~=0);
k8 = find(pickle_data_s8.label~=0);
k10 = find(pickle_data_s10.label~=0);
k11 = find(pickle_data_s11.label~=0);
k13 = find(pickle_data_s13.label~=0);
k14 = find(pickle_data_s14.label~=0);
k15 = find(pickle_data_s15.label~=0);
k16 = find(pickle_data_s16.label~=0);
k17 = find(pickle_data_s17.label~=0);

[hr2, label2] = HR(pickle_data_s2);
[hr3, label3] = HR(pickle_data_s3);
[hr4, label4] = HR(pickle_data_s4);
[hr5, label5] = HR(pickle_data_s5);
[hr6, label6] = HR(pickle_data_s6);
[hr7, label7] = HR(pickle_data_s7);
[hr8, label8] = HR(pickle_data_s8);
[hr10, label10] = HR(pickle_data_s10);
[hr11, label11] = HR(pickle_data_s11);
[hr13, label13] = HR(pickle_data_s13);
[hr14, label14] = HR(pickle_data_s14);
[hr15, label15] = HR(pickle_data_s15);
[hr16, label16] = HR(pickle_data_s16);
[hr17, label17] = HR(pickle_data_s17);

kh2 = label2~=0;
kh3 = find(label3~=0);
kh4 = find(label4~=0);
kh5 = find(label5~=0);
kh6 = find(label6~=0);
kh7 = find(label7~=0);
kh8 = find(label8~=0);
kh10 = find(label10~=0);
kh11 = find(label11~=0);
kh13 = find(label13~=0);
kh14 = find(label14~=0);
kh15 = find(label15~=0);
kh16 = find(label16~=0);
kh17 = find(label17~=0);

part   = [pickle_data_s2.signal.chest.Temp(k2) pickle_data_s2.signal.chest.EDA(k2) hr2(kh2) cast(pickle_data_s2.label(k2),"double").';...
        
           pickle_data_s3.signal.chest.Temp(k3) pickle_data_s3.signal.chest.EDA(k3) hr3(kh3) cast(pickle_data_s3.label(k3),"double").';...
          pickle_data_s4.signal.chest.Temp(k4) pickle_data_s4.signal.chest.EDA(k4) hr4(kh4) cast(pickle_data_s4.label(k4),"double").';...
          pickle_data_s5.signal.chest.Temp(k5) pickle_data_s5.signal.chest.EDA(k5) hr5(kh5) cast(pickle_data_s5.label(k5),"double").';...
          pickle_data_s6.signal.chest.Temp(k6) pickle_data_s6.signal.chest.EDA(k6) hr6(kh6) cast(pickle_data_s6.label(k6),"double").';...
          pickle_data_s7.signal.chest.Temp(k7)  pickle_data_s7.signal.chest.EDA(k7) hr7(kh7) cast(pickle_data_s7.label(k7),"double").';...
          pickle_data_s8.signal.chest.Temp(k8)  pickle_data_s8.signal.chest.EDA(k8) hr8(kh8) cast(pickle_data_s8.label(k8),"double").';...
          pickle_data_s10.signal.chest.Temp(k10) pickle_data_s10.signal.chest.EDA(k10) hr10(kh10) cast(pickle_data_s10.label(k10),"double").';...
          pickle_data_s11.signal.chest.Temp(k11) pickle_data_s11.signal.chest.EDA(k11) hr11(kh11) cast(pickle_data_s11.label(k11),"double").';...
          pickle_data_s13.signal.chest.Temp(k13) pickle_data_s13.signal.chest.EDA(k13) hr13(kh13) cast(pickle_data_s13.label(k13),"double").';...
          pickle_data_s14.signal.chest.Temp(k14) pickle_data_s14.signal.chest.EDA(k14) hr14(kh14) cast(pickle_data_s14.label(k14),"double").';...
          pickle_data_s15.signal.chest.Temp(k15) pickle_data_s15.signal.chest.EDA(k15) hr15(kh15) cast(pickle_data_s15.label(k15),"double").';...
          pickle_data_s16.signal.chest.Temp(k16) pickle_data_s16.signal.chest.EDA(k16) hr16(kh16) cast(pickle_data_s16.label(k16),"double").';...
          pickle_data_s17.signal.chest.Temp(k17) pickle_data_s17.signal.chest.EDA(k17) hr17(kh17) cast(pickle_data_s17.label(k17),"double").'];

error_t = find(part(:,1)<28 | part(:,1)>37);
error_e = find(part(:,2)<=0 | part(:,2)>20);
error_h = find(part(:,3)<40 | part(:,3)>165);
error = union(error_t,error_e);
error = union(error, error_h);
part(error,:)=[];
      
c = cvpartition(length(part),'KFold', 10);

idx1 = training(c,1);
idx2 = training(c,2);
idx3 = training(c,3);
idx4 = training(c,4);
idx5 = training(c,5);
idx6 = training(c,6);
idx7 = training(c,7);
idx8 = training(c,8);
idx9 = training(c,9);
idx10 = training(c,10);



end


