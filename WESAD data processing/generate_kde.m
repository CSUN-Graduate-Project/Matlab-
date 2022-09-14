function [cv, sw, nsw, s_test, ns_test]=generate_kde(part,idx)

%part = part(idx==1);


temp = part(:,1);
eda = part(:,2);
hr = part(:,3);
label = part(:,4);

temp_t = temp(idx==0);
eda_t = eda(idx==0);
hr_t = hr(idx==0);
label_t = label(idx==0);

temp = temp(idx==1);
eda = eda(idx==1);
hr = hr(idx==1);
label = label(idx==1);



s_test = [temp_t(label_t==2) eda_t(label_t==2) hr_t(label_t==2)];

ns_test = [temp_t(label_t~=2) eda_t(label_t~=2) hr_t(label_t~=2)];

temp_s = temp(label==2);

temp_s_range = (28:.125:37);

[f_t, xi_t] = ksdensity(temp_s,temp_s_range);

p_temp_s  = zeros(1,18);
j = 1;
for n = 1:18
    
    p_temp_s(n) = trapz(temp_s_range(j:j+4),f_t(j:j+4));
    j = j+4;
end

p_temp_s = p_temp_s.*100;

%------------------------------------------------------------------

temp_ns_range = (28:.125:37);
temp_ns = temp(label~=2);

[f_t_ns, xi_t_ns] = ksdensity(temp_ns,temp_ns_range);

p_temp_ns  = zeros(1,18);

j = 1;

for n = 1:18
    
    p_temp_ns(n) = trapz(temp_ns_range(j:j+4),f_t_ns(j:j+4));
    j = j+4;
end

p_temp_ns = p_temp_ns.*100;

%------------------------------------------------------------------

eda_s_range = (0:.25:20);
eda_s = eda(label==2);

[f_e_s, xi_e_s] = ksdensity(eda_s,eda_s_range);

p_eda_s  = zeros(1,20);


j = 1;

for n = 1:20
    
    p_eda_s(n) = trapz(eda_s_range(j:j+4),f_e_s(j:j+4));
    j = j+4;
end

p_eda_s = p_eda_s.*100;

%------------------------------------------------------------------

eda_ns_range = (0:.25:20);
eda_ns = eda(label~=2);

[f_e_ns, xi_e_ns] = ksdensity(eda_ns,eda_ns_range);

p_eda_ns  = zeros(1,20);

j = 1;

for n = 1:20
    
    p_eda_ns(n) = trapz(eda_ns_range(j:j+4),f_e_ns(j:j+4));
    j = j+4;
end

p_eda_ns = p_eda_ns.*100;

%------------------------------------------------------------------

hr_s_range = (40:.125:165);
hr_s = hr(label==2);

[f_h_s, xi_h_s] = ksdensity(hr_s,hr_s_range);

p_hr_s  = zeros(1,25);

j = 1;

for n = 1:25
    
    p_hr_s(n) = trapz(hr_s_range(j:j+40),f_h_s(j:j+40));
    j = j+40;
end

p_hr_s = p_hr_s.*100;

%------------------------------------------------------------------

hr_ns_range = (40:.125:165);
hr_ns = hr(label~=2);

[f_h_ns, xi_h_ns] = ksdensity(hr_ns,hr_ns_range);

p_hr_ns  = zeros(1,25);

j = 1;

for n = 1:25
    
    p_hr_ns(n) = trapz(hr_ns_range(j:j+40),f_h_ns(j:j+40));
    j = j+40;
end

p_hr_ns = p_hr_ns.*100;

%------------------------------------------------------------------

s_total = size(temp_s)+size(eda_s)+size(hr_s);

ns_total = size(temp_ns)+size(eda_ns)+size(hr_ns);

sw = (s_total(1)/(s_total(1)+ns_total(1)))*100;

nsw = (ns_total(1)/(s_total(1)+ns_total(1)))*100;

p_temp_s = p_temp_s.';

p_temp_ns = p_temp_ns.';
p_eda_s = p_eda_s.';
p_eda_ns = p_eda_ns.';
p_hr_s = p_hr_s.';
p_hr_ns = p_hr_ns.';

cv.temp_s = p_temp_s;
cv.temp_ns = p_temp_ns;
cv.eda_s = p_eda_s;
cv.eda_ns = p_eda_ns;
cv.hr_s = p_hr_s;
cv.hr_ns = p_hr_ns;
end