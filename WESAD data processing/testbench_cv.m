function [r_cv, history_ns] = testbench_cv(s_test,ns_test, cv ,sw,nsw, w, t)
size_s = size(s_test);
size_ns = size(ns_test);

s_a = 0;
ns_a = 0;

s_b = 0;
ns_b = 0;

e = 0;
total_a = size(s_test);
total_b = size(ns_test);

%history_s = zeros(total(1),8);

history_ns = zeros(total_a(1),8);

% S test
for i=1:size_s(1)
%------------------------------------------------------------------
%stressed    
        %temp
         if (s_test(i,1)>28) && (s_test(i,1)<=28.5)
            pts = cv.temp_s(1);
        elseif (s_test(i,1)>28.5) && (s_test(i,1)<=29)
            pts = cv.temp_s(2);
        elseif (s_test(i,1)>29) && (s_test(i,1)<=29.5)
            pts = cv.temp_s(3);
        elseif (s_test(i,1)>29.5) && (s_test(i,1)<=30)
            pts = cv.temp_s(4);
        elseif (s_test(i,1)>30) && (s_test(i,1)<=30.5)
            pts = cv.temp_s(5);
        elseif (s_test(i,1)>30.5) && (s_test(i,1)<=31)
            pts = cv.temp_s(6);
        elseif (s_test(i,1)>=31) && (s_test(i,1)<=31.5)
            pts = cv.temp_s(7);
        elseif (s_test(i,1)>31.5) && (s_test(i,1)<=32)
            pts = cv.temp_s(8);
        elseif (s_test(i,1)>32) && (s_test(i,1)<=32.5)
            pts = cv.temp_s(9);
        elseif (s_test(i,1)>32.5) && (s_test(i,1)<=33)
            pts = cv.temp_s(10);
        elseif (s_test(i,1)>33) && (s_test(i,1)<=33.5)
            pts = cv.temp_s(11);
        elseif (s_test(i,1)>33.5) && (s_test(i,1)<=34)
            pts = cv.temp_s(12);
        elseif (s_test(i,1)>34) && (s_test(i,1)<=34.5)
            pts = cv.temp_s(13);
        elseif (s_test(i,1)>34.5) && (s_test(i,1)<=35)
            pts = cv.temp_s(14);
        elseif (s_test(i,1)>35) && (s_test(i,1)<=35.5)
            pts = cv.temp_s(15);
        elseif (s_test(i,1)>35.5) && (s_test(i,1)<=36)
            pts = cv.temp_s(16);
        elseif (s_test(i,1)>36) && (s_test(i,1)<=36.5)
            pts = cv.temp_s(17);
        elseif (s_test(i,1)>36.5) && (s_test(i,1)<=37)
            pts = cv.temp_s(18);
        else
            pts = .0001;
        end
        
        %eda
        if (s_test(i,2)>=0) && (s_test(i,2)<=1)
            pes = cv.eda_s(1);
        elseif (s_test(i,2)>1) && (s_test(i,2)<=2)
            pes = cv.eda_s(2);
        elseif (s_test(i,2)>2) && (s_test(i,2)<=3)
            pes = cv.eda_s(3);
        elseif (s_test(i,2)>3) && (s_test(i,2)<=4)
            pes = cv.eda_s(4);
        elseif (s_test(i,2)>4) && (s_test(i,2)<=5)
            pes = cv.eda_s(5);
        elseif (s_test(i,2)>5) && (s_test(i,2)<=6)
            pes = cv.eda_s(6);
        elseif (s_test(i,2)>6) && (s_test(i,2)<=7)
            pes = cv.eda_s(7);
        elseif (s_test(i,2)>7) && (s_test(i,2)<=8)
            pes = cv.eda_s(8);
        elseif (s_test(i,2)>8) && (s_test(i,2)<=9)
            pes = cv.eda_s(9);
        elseif (s_test(i,2)>9) && (s_test(i,2)<=10)
            pes = cv.eda_s(10);
        elseif (s_test(i,2)>10) && (s_test(i,2)<=11)
            pes = cv.eda_s(11);
       elseif (s_test(i,2)>11) && (s_test(i,2)<=12)
            pes = cv.eda_s(12);
        elseif (s_test(i,2)>12) && (s_test(i,2)<=13)
            pes = cv.eda_s(13);
        elseif (s_test(i,2)>13) && (s_test(i,2)<=14)
            pes = cv.eda_s(14);
        elseif (s_test(i,2)>14) && (s_test(i,2)<=15)
            pes = cv.eda_s(15);
        elseif (s_test(i,2)>15) && (s_test(i,2)<=16)
            pes = cv.eda_s(16);
        elseif (s_test(i,2)>16) && (s_test(i,2)<=17)
            pes = cv.eda_s(17);
        elseif (s_test(i,2)>17) && (s_test(i,2)<=18)
            pes = cv.eda_s(18);
        elseif (s_test(i,2)>18) && (s_test(i,2)<=19)
            pes = cv.eda_s(19);
        elseif (s_test(i,2)>19) && (s_test(i,2)<=20)
            pes = cv.eda_s(20);
        else
            pes = .0001;
        end
                 
        %heart rate
        if (s_test(i,3)>=40) && (s_test(i,3)<=45)
            phs = cv.hr_s(1);
        elseif (s_test(i,3)>45) && (s_test(i,3)<=50)
            phs = cv.hr_s(2);
        elseif (s_test(i,3)>50) && (s_test(i,3)<=55)
            phs = cv.hr_s(3);
        elseif (s_test(i,3)>55) && (s_test(i,3)<=60)
            phs = cv.hr_s(4);
        elseif (s_test(i,3)>60) && (s_test(i,3)<=65)
            phs = cv.hr_s(5);
        elseif (s_test(i,3)>65) && (s_test(i,3)<=70)
            phs = cv.hr_s(6);
        elseif (s_test(i,3)>70) && (s_test(i,3)<=75)
            phs = cv.hr_s(7);
        elseif (s_test(i,3)>75) && (s_test(i,3)<=80)
            phs = cv.hr_s(8);
        elseif (s_test(i,3)>80) && (s_test(i,3)<=85)
            phs = cv.hr_s(9);
        elseif (s_test(i,3)>85) && (s_test(i,3)<=90)
            phs = cv.hr_s(10);
        elseif (s_test(i,3)>90) && (s_test(i,3)<=95)
            phs = cv.hr_s(11);
        elseif (s_test(i,3)>95) && (s_test(i,3)<=100)
            phs = cv.hr_s(12);
        elseif (s_test(i,3)>100) && (s_test(i,3)<=105)
            phs = cv.hr_s(13);
        elseif (s_test(i,3)>105) && (s_test(i,3)<=110)
            phs = cv.hr_s(14);
        elseif (s_test(i,3)>110) && (s_test(i,3)<=115)
            phs = cv.hr_s(15);
        elseif (s_test(i,3)>115) && (s_test(i,3)<=120)
            phs = cv.hr_s(16);
        elseif (s_test(i,3)>120) && (s_test(i,3)<=125)
            phs = cv.hr_s(17);
        elseif (s_test(i,3)>125) && (s_test(i,3)<=130)
            phs = cv.hr_s(18);
        elseif (s_test(i,3)>130) && (s_test(i,3)<=135)
            phs = cv.hr_s(19);
        elseif (s_test(i,3)>135) && (s_test(i,3)<=140)
            phs = cv.hr_s(20);
        elseif (s_test(i,3)>140) && (s_test(i,3)<=145)
            phs = cv.hr_s(21);
        elseif (s_test(i,3)>145) && (s_test(i,3)<=150)
            phs = cv.hr_s(22);
        elseif (s_test(i,3)>150) && (s_test(i,3)<=155)
            phs = cv.hr_s(23);
        elseif (s_test(i,3)>155) && (s_test(i,3)<=160)
            phs = cv.hr_s(24);
        elseif (s_test(i,3)>160) && (s_test(i,3)<=165)
            phs = cv.hr_s(25);
        else
            phs = .0001;
        end
        
        
%------------------------------------------------------------------
%not stressed
         %temp
        if (s_test(i,1)>28) && (s_test(i,1)<=28.5)
            ptns = cv.temp_ns(1);
        elseif (s_test(i,1)>28.5) && (s_test(i,1)<=29)
            ptns = cv.temp_ns(2);
        elseif (s_test(i,1)>29) && (s_test(i,1)<=29.5)
            ptns = cv.temp_ns(3);
        elseif (s_test(i,1)>29.5) && (s_test(i,1)<=30)
            ptns = cv.temp_ns(4);
        elseif (s_test(i,1)>30) && (s_test(i,1)<=30.5)
            ptns = cv.temp_ns(5);
        elseif (s_test(i,1)>30.5) && (s_test(i,1)<=31)
            ptns = cv.temp_ns(6);
        elseif (s_test(i,1)>=31) && (s_test(i,1)<=31.5)
            ptns = cv.temp_ns(7);
        elseif (s_test(i,1)>31.5) && (s_test(i,1)<=32)
            ptns = cv.temp_ns(8);
        elseif (s_test(i,1)>32) && (s_test(i,1)<=32.5)
            ptns = cv.temp_ns(9);
        elseif (s_test(i,1)>32.5) && (s_test(i,1)<=33)
            ptns = cv.temp_ns(10);
        elseif (s_test(i,1)>33) && (s_test(i,1)<=33.5)
            ptns = cv.temp_ns(11);
        elseif (s_test(i,1)>33.5) && (s_test(i,1)<=34)
            ptns = cv.temp_ns(12);
        elseif (s_test(i,1)>34) && (s_test(i,1)<=34.5)
            ptns = cv.temp_ns(13);
        elseif (s_test(i,1)>34.5) && (s_test(i,1)<=35)
            ptns = cv.temp_ns(14);
        elseif (s_test(i,1)>35) && (s_test(i,1)<=35.5)
            ptns = cv.temp_ns(15);
        elseif (s_test(i,1)>35.5) && (s_test(i,1)<=36)
            ptns = cv.temp_ns(16);
        elseif (s_test(i,1)>36) && (s_test(i,1)<=36.5)
            ptns = cv.temp_ns(17);
        elseif (s_test(i,1)>36.5) && (s_test(i,1)<=37)
            ptns = cv.temp_ns(18);
        else
            ptns = .0001;
        end
        
        %eda
        if (s_test(i,2)>=0) && (s_test(i,2)<=1)
            pens = cv.eda_ns(1);
        elseif (s_test(i,2)>1) && (s_test(i,2)<=2)
            pens = cv.eda_ns(2);
        elseif (s_test(i,2)>2) && (s_test(i,2)<=3)
            pens = cv.eda_ns(3);
        elseif (s_test(i,2)>3) && (s_test(i,2)<=4)
            pens = cv.eda_ns(4);
        elseif (s_test(i,2)>4) && (s_test(i,2)<=5)
            pens = cv.eda_ns(5);
        elseif (s_test(i,2)>5) && (s_test(i,2)<=6)
            pens = cv.eda_ns(6);
        elseif (s_test(i,2)>6) && (s_test(i,2)<=7)
            pens = cv.eda_ns(7);
        elseif (s_test(i,2)>7) && (s_test(i,2)<=8)
            pens = cv.eda_ns(8);
        elseif (s_test(i,2)>8) && (s_test(i,2)<=9)
            pens = cv.eda_ns(9);
        elseif (s_test(i,2)>9) && (s_test(i,2)<=10)
            pens = cv.eda_ns(10);
        elseif (s_test(i,2)>10) && (s_test(i,2)<=11)
            pens = cv.eda_ns(11);
       elseif (s_test(i,2)>11) && (s_test(i,2)<=12)
            pens = cv.eda_ns(12);
        elseif (s_test(i,2)>12) && (s_test(i,2)<=13)
            pens = cv.eda_ns(13);
        elseif (s_test(i,2)>13) && (s_test(i,2)<=14)
            pens = cv.eda_ns(14);
        elseif (s_test(i,2)>14) && (s_test(i,2)<=15)
            pens = cv.eda_ns(15);
        elseif (s_test(i,2)>15) && (s_test(i,2)<=16)
            pens = cv.eda_ns(16);
        elseif (s_test(i,2)>16) && (s_test(i,2)<=17)
            pens = cv.eda_ns(17);
        elseif (s_test(i,2)>17) && (s_test(i,2)<=18)
            pens = cv.eda_ns(18);
        elseif (s_test(i,2)>18) && (s_test(i,2)<=19)
            pens = cv.eda_ns(19);
        elseif (s_test(i,2)>19) && (s_test(i,2)<=20)
            pens = cv.eda_ns(20);
        else
            pens = .0001;
        end
                 
        %heart rate
        if (s_test(i,3)>=40) && (s_test(i,3)<=45)
            phns = cv.hr_ns(1);
        elseif (s_test(i,3)>45) && (s_test(i,3)<=50)
            phns = cv.hr_ns(2);
        elseif (s_test(i,3)>50) && (s_test(i,3)<=55)
            phns = cv.hr_ns(3);
        elseif (s_test(i,3)>55) && (s_test(i,3)<=60)
            phns = cv.hr_ns(4);
        elseif (s_test(i,3)>60) && (s_test(i,3)<=65)
            phns = cv.hr_ns(5);
        elseif (s_test(i,3)>65) && (s_test(i,3)<=70)
            phns = cv.hr_ns(6);
        elseif (s_test(i,3)>70) && (s_test(i,3)<=75)
            phns = cv.hr_ns(7);
        elseif (s_test(i,3)>75) && (s_test(i,3)<=80)
            phns = cv.hr_ns(8);
        elseif (s_test(i,3)>80) && (s_test(i,3)<=85)
            phns = cv.hr_ns(9);
        elseif (s_test(i,3)>85) && (s_test(i,3)<=90)
            phns = cv.hr_ns(10);
        elseif (s_test(i,3)>90) && (s_test(i,3)<=95)
            phns = cv.hr_ns(11);
        elseif (s_test(i,3)>95) && (s_test(i,3)<=100)
            phns = cv.hr_ns(12);
        elseif (s_test(i,3)>100) && (s_test(i,3)<=105)
            phns = cv.hr_ns(13);
        elseif (s_test(i,3)>105) && (s_test(i,3)<=110)
            phns = cv.hr_ns(14);
        elseif (s_test(i,3)>110) && (s_test(i,3)<=115)
            phns = cv.hr_ns(15);
        elseif (s_test(i,3)>115) && (s_test(i,3)<=120)
            phns = cv.hr_ns(16);
        elseif (s_test(i,3)>120) && (s_test(i,3)<=125)
            phns = cv.hr_ns(17);
        elseif (s_test(i,3)>125) && (s_test(i,3)<=130)
            phns = cv.hr_ns(18);
        elseif (s_test(i,3)>130) && (s_test(i,3)<=135)
            phns = cv.hr_ns(19);
        elseif (s_test(i,3)>135) && (s_test(i,3)<=140)
            phns = cv.hr_ns(20);
        elseif (s_test(i,3)>140) && (s_test(i,3)<=145)
            phns = cv.hr_ns(21);
        elseif (s_test(i,3)>145) && (s_test(i,3)<=150)
            phns = cv.hr_ns(22);
        elseif (s_test(i,3)>150) && (s_test(i,3)<=155)
            phns = cv.hr_ns(23);
        elseif (s_test(i,3)>155) && (s_test(i,3)<=160)
            phns = cv.hr_ns(24);
        elseif (s_test(i,3)>160) && (s_test(i,3)<=165)
            phns = cv.hr_ns(25);
        else
            phns = .0001;
        end
        
        stressed_score_a = sw*phs*pes*pts*w;
       % stressed_score = sw*pes*w;
        
        not_score_a = nsw*phns*pens*ptns*t;
        %not_score = nsw*pens*t;
        
        if stressed_score_a<=not_score_a
            ns_a = ns_a +1;
            
            history_ns(i,1) = ptns;
            history_ns(i,2) = pens;
            history_ns(i,3) = phns;
            history_ns(i,4) = not_score_a;
            history_ns(i,5) = pts;
            history_ns(i,6) = pes;
            history_ns(i,7) = phs;
            history_ns(i,8) = stressed_score_a;
            
            
            
        elseif not_score_a<=stressed_score_a
            s_a = s_a + 1;
            %{
            history_s(i,1) = ptns;
            history_s(i,2) = pens;
            history_s(i,3) = phns;
            history_s(i,4) = not_score;
            history_s(i,5) = pts;
            history_s(i,6) = pes;
            history_s(i,7) = phs;
            history_s(i,8) = stressed_score;
            %}
        else 
            e = e + 1;
        end

                   
end

%NS test 

for i=1:size_ns(1)
%------------------------------------------------------------------
%stressed    
        %temp
         if (ns_test(i,1)>28) && (ns_test(i,1)<=28.5)
            pts_b = cv.temp_s(1);
        elseif (ns_test(i,1)>28.5) && (ns_test(i,1)<=29)
            pts_b = cv.temp_s(2);
        elseif (ns_test(i,1)>29) && (ns_test(i,1)<=29.5)
            pts_b = cv.temp_s(3);
        elseif (ns_test(i,1)>29.5) && (ns_test(i,1)<=30)
            pts_b = cv.temp_s(4);
        elseif (ns_test(i,1)>30) && (ns_test(i,1)<=30.5)
            pts_b = cv.temp_s(5);
        elseif (ns_test(i,1)>30.5) && (ns_test(i,1)<=31)
            pts_b = cv.temp_s(6);
        elseif (ns_test(i,1)>=31) && (ns_test(i,1)<=31.5)
            pts_b = cv.temp_s(7);
        elseif (ns_test(i,1)>31.5) && (ns_test(i,1)<=32)
            pts_b = cv.temp_s(8);
        elseif (ns_test(i,1)>32) && (ns_test(i,1)<=32.5)
            pts_b = cv.temp_s(9);
        elseif (ns_test(i,1)>32.5) && (ns_test(i,1)<=33)
            pts_b = cv.temp_s(10);
        elseif (ns_test(i,1)>33) && (ns_test(i,1)<=33.5)
            pts_b = cv.temp_s(11);
        elseif (ns_test(i,1)>33.5) && (ns_test(i,1)<=34)
            pts_b = cv.temp_s(12);
        elseif (ns_test(i,1)>34) && (ns_test(i,1)<=34.5)
            pts_b = cv.temp_s(13);
        elseif (ns_test(i,1)>34.5) && (ns_test(i,1)<=35)
            pts_b = cv.temp_s(14);
        elseif (ns_test(i,1)>35) && (ns_test(i,1)<=35.5)
            pts_b = cv.temp_s(15);
        elseif (ns_test(i,1)>35.5) && (ns_test(i,1)<=36)
            pts_b = cv.temp_s(16);
        elseif (ns_test(i,1)>36) && (ns_test(i,1)<=36.5)
            pts_b = cv.temp_s(17);
        elseif (ns_test(i,1)>36.5) && (ns_test(i,1)<=37)
            pts_b = cv.temp_s(18);
        else
            pts_b = .0001;
        end
        
        %eda
        if (ns_test(i,2)>=0) && (ns_test(i,2)<=1)
            pes_b = cv.eda_s(1);
        elseif (ns_test(i,2)>1) && (ns_test(i,2)<=2)
            pes_b = cv.eda_s(2);
        elseif (ns_test(i,2)>2) && (ns_test(i,2)<=3)
            pes_b = cv.eda_s(3);
        elseif (ns_test(i,2)>3) && (ns_test(i,2)<=4)
            pes_b = cv.eda_s(4);
        elseif (ns_test(i,2)>4) && (ns_test(i,2)<=5)
            pes_b = cv.eda_s(5);
        elseif (ns_test(i,2)>5) && (ns_test(i,2)<=6)
            pes_b = cv.eda_s(6);
        elseif (ns_test(i,2)>6) && (ns_test(i,2)<=7)
            pes_b = cv.eda_s(7);
        elseif (ns_test(i,2)>7) && (ns_test(i,2)<=8)
            pes_b = cv.eda_s(8);
        elseif (ns_test(i,2)>8) && (ns_test(i,2)<=9)
            pes_b = cv.eda_s(9);
        elseif (ns_test(i,2)>9) && (ns_test(i,2)<=10)
            pes_b = cv.eda_s(10);
        elseif (ns_test(i,2)>10) && (ns_test(i,2)<=11)
            pes_b = cv.eda_s(11);
       elseif (ns_test(i,2)>11) && (ns_test(i,2)<=12)
            pes_b = cv.eda_s(12);
        elseif (ns_test(i,2)>12) && (ns_test(i,2)<=13)
            pes_b = cv.eda_s(13);
        elseif (ns_test(i,2)>13) && (ns_test(i,2)<=14)
            pes_b = cv.eda_s(14);
        elseif (ns_test(i,2)>14) && (ns_test(i,2)<=15)
            pes_b = cv.eda_s(15);
        elseif (ns_test(i,2)>15) && (ns_test(i,2)<=16)
            pes_b = cv.eda_s(16);
        elseif (ns_test(i,2)>16) && (ns_test(i,2)<=17)
            pes_b = cv.eda_s(17);
        elseif (ns_test(i,2)>17) && (ns_test(i,2)<=18)
            pes_b = cv.eda_s(18);
        elseif (ns_test(i,2)>18) && (ns_test(i,2)<=19)
            pes_b = cv.eda_s(19);
        elseif (ns_test(i,2)>19) && (ns_test(i,2)<=20)
            pes_b = cv.eda_s(20);
        else
            pes_b = .0001;
        end
                 
        %heart rate
        if (ns_test(i,3)>=40) && (ns_test(i,3)<=45)
            phs_b = cv.hr_s(1);
        elseif (ns_test(i,3)>45) && (ns_test(i,3)<=50)
            phs_b = cv.hr_s(2);
        elseif (ns_test(i,3)>50) && (ns_test(i,3)<=55)
            phs_b = cv.hr_s(3);
        elseif (ns_test(i,3)>55) && (ns_test(i,3)<=60)
            phs_b = cv.hr_s(4);
        elseif (ns_test(i,3)>60) && (ns_test(i,3)<=65)
            phs_b = cv.hr_s(5);
        elseif (ns_test(i,3)>65) && (ns_test(i,3)<=70)
            phs_b = cv.hr_s(6);
        elseif (ns_test(i,3)>70) && (ns_test(i,3)<=75)
            phs_b = cv.hr_s(7);
        elseif (ns_test(i,3)>75) && (ns_test(i,3)<=80)
            phs_b = cv.hr_s(8);
        elseif (ns_test(i,3)>80) && (ns_test(i,3)<=85)
            phs_b = cv.hr_s(9);
        elseif (ns_test(i,3)>85) && (ns_test(i,3)<=90)
            phs_b = cv.hr_s(10);
        elseif (ns_test(i,3)>90) && (ns_test(i,3)<=95)
            phs_b = cv.hr_s(11);
        elseif (ns_test(i,3)>95) && (ns_test(i,3)<=100)
            phs_b = cv.hr_s(12);
        elseif (ns_test(i,3)>100) && (ns_test(i,3)<=105)
            phs_b = cv.hr_s(13);
        elseif (ns_test(i,3)>105) && (ns_test(i,3)<=110)
            phs_b = cv.hr_s(14);
        elseif (ns_test(i,3)>110) && (ns_test(i,3)<=115)
            phs_b = cv.hr_s(15);
        elseif (ns_test(i,3)>115) && (ns_test(i,3)<=120)
            phs_b = cv.hr_s(16);
        elseif (ns_test(i,3)>120) && (ns_test(i,3)<=125)
            phs_b = cv.hr_s(17);
        elseif (ns_test(i,3)>125) && (ns_test(i,3)<=130)
            phs_b = cv.hr_s(18);
        elseif (ns_test(i,3)>130) && (ns_test(i,3)<=135)
            phs_b = cv.hr_s(19);
        elseif (ns_test(i,3)>135) && (ns_test(i,3)<=140)
            phs_b = cv.hr_s(20);
        elseif (ns_test(i,3)>140) && (ns_test(i,3)<=145)
            phs_b = cv.hr_s(21);
        elseif (ns_test(i,3)>145) && (ns_test(i,3)<=150)
            phs_b = cv.hr_s(22);
        elseif (ns_test(i,3)>150) && (ns_test(i,3)<=155)
            phs_b = cv.hr_s(23);
        elseif (ns_test(i,3)>155) && (ns_test(i,3)<=160)
            phs_b = cv.hr_s(24);
        elseif (ns_test(i,3)>160) && (ns_test(i,3)<=165)
            phs_b = cv.hr_s(25);
        else
            phs_b = .0001;
        end
        
        
%------------------------------------------------------------------
%not stressed
         %temp
        if (ns_test(i,1)>28) && (ns_test(i,1)<=28.5)
            ptns_b = cv.temp_ns(1);
        elseif (ns_test(i,1)>28.5) && (ns_test(i,1)<=29)
            ptns_b = cv.temp_ns(2);
        elseif (ns_test(i,1)>29) && (ns_test(i,1)<=29.5)
            ptns_b = cv.temp_ns(3);
        elseif (ns_test(i,1)>29.5) && (ns_test(i,1)<=30)
            ptns_b = cv.temp_ns(4);
        elseif (ns_test(i,1)>30) && (ns_test(i,1)<=30.5)
            ptns_b = cv.temp_ns(5);
        elseif (ns_test(i,1)>30.5) && (ns_test(i,1)<=31)
            ptns_b = cv.temp_ns(6);
        elseif (ns_test(i,1)>=31) && (ns_test(i,1)<=31.5)
            ptns_b = cv.temp_ns(7);
        elseif (ns_test(i,1)>31.5) && (ns_test(i,1)<=32)
            ptns_b = cv.temp_ns(8);
        elseif (ns_test(i,1)>32) && (ns_test(i,1)<=32.5)
            ptns_b = cv.temp_ns(9);
        elseif (ns_test(i,1)>32.5) && (ns_test(i,1)<=33)
            ptns_b = cv.temp_ns(10);
        elseif (ns_test(i,1)>33) && (ns_test(i,1)<=33.5)
            ptns_b = cv.temp_ns(11);
        elseif (ns_test(i,1)>33.5) && (ns_test(i,1)<=34)
            ptns_b = cv.temp_ns(12);
        elseif (ns_test(i,1)>34) && (ns_test(i,1)<=34.5)
            ptns_b = cv.temp_ns(13);
        elseif (ns_test(i,1)>34.5) && (ns_test(i,1)<=35)
            ptns_b = cv.temp_ns(14);
        elseif (ns_test(i,1)>35) && (ns_test(i,1)<=35.5)
            ptns_b = cv.temp_ns(15);
        elseif (ns_test(i,1)>35.5) && (ns_test(i,1)<=36)
            ptns_b = cv.temp_ns(16);
        elseif (ns_test(i,1)>36) && (ns_test(i,1)<=36.5)
            ptns_b = cv.temp_ns(17);
        elseif (ns_test(i,1)>36.5) && (ns_test(i,1)<=37)
            ptns_b = cv.temp_ns(18);
        else
            ptns_b = .0001;
        end
        
        %eda
        if (ns_test(i,2)>=0) && (ns_test(i,2)<=1)
            pens_b = cv.eda_ns(1);
        elseif (ns_test(i,2)>1) && (ns_test(i,2)<=2)
            pens_b = cv.eda_ns(2);
        elseif (ns_test(i,2)>2) && (ns_test(i,2)<=3)
            pens_b = cv.eda_ns(3);
        elseif (ns_test(i,2)>3) && (ns_test(i,2)<=4)
            pens_b = cv.eda_ns(4);
        elseif (ns_test(i,2)>4) && (ns_test(i,2)<=5)
            pens_b = cv.eda_ns(5);
        elseif (ns_test(i,2)>5) && (ns_test(i,2)<=6)
            pens_b = cv.eda_ns(6);
        elseif (ns_test(i,2)>6) && (ns_test(i,2)<=7)
            pens_b = cv.eda_ns(7);
        elseif (ns_test(i,2)>7) && (ns_test(i,2)<=8)
            pens_b = cv.eda_ns(8);
        elseif (ns_test(i,2)>8) && (ns_test(i,2)<=9)
            pens_b = cv.eda_ns(9);
        elseif (ns_test(i,2)>9) && (ns_test(i,2)<=10)
            pens_b = cv.eda_ns(10);
        elseif (ns_test(i,2)>10) && (ns_test(i,2)<=11)
            pens_b = cv.eda_ns(11);
       elseif (ns_test(i,2)>11) && (ns_test(i,2)<=12)
            pens_b = cv.eda_ns(12);
        elseif (ns_test(i,2)>12) && (ns_test(i,2)<=13)
            pens_b = cv.eda_ns(13);
        elseif (ns_test(i,2)>13) && (ns_test(i,2)<=14)
            pens_b = cv.eda_ns(14);
        elseif (ns_test(i,2)>14) && (ns_test(i,2)<=15)
            pens_b = cv.eda_ns(15);
        elseif (ns_test(i,2)>15) && (ns_test(i,2)<=16)
            pens_b = cv.eda_ns(16);
        elseif (ns_test(i,2)>16) && (ns_test(i,2)<=17)
            pens_b = cv.eda_ns(17);
        elseif (ns_test(i,2)>17) && (ns_test(i,2)<=18)
            pens_b = cv.eda_ns(18);
        elseif (ns_test(i,2)>18) && (ns_test(i,2)<=19)
            pens_b = cv.eda_ns(19);
        elseif (ns_test(i,2)>19) && (ns_test(i,2)<=20)
            pens_b = cv.eda_ns(20);
        else
            pens_b = .0001;
        end
                 
        %heart rate
        if (ns_test(i,3)>=40) && (ns_test(i,3)<=45)
            phns_b = cv.hr_ns(1);
        elseif (ns_test(i,3)>45) && (ns_test(i,3)<=50)
            phns_b = cv.hr_ns(2);
        elseif (ns_test(i,3)>50) && (ns_test(i,3)<=55)
            phns_b = cv.hr_ns(3);
        elseif (ns_test(i,3)>55) && (ns_test(i,3)<=60)
            phns_b = cv.hr_ns(4);
        elseif (ns_test(i,3)>60) && (ns_test(i,3)<=65)
            phns_b = cv.hr_ns(5);
        elseif (ns_test(i,3)>65) && (ns_test(i,3)<=70)
            phns_b = cv.hr_ns(6);
        elseif (ns_test(i,3)>70) && (ns_test(i,3)<=75)
            phns_b = cv.hr_ns(7);
        elseif (ns_test(i,3)>75) && (ns_test(i,3)<=80)
            phns_b = cv.hr_ns(8);
        elseif (ns_test(i,3)>80) && (ns_test(i,3)<=85)
            phns_b = cv.hr_ns(9);
        elseif (ns_test(i,3)>85) && (ns_test(i,3)<=90)
            phns_b = cv.hr_ns(10);
        elseif (ns_test(i,3)>90) && (ns_test(i,3)<=95)
            phns_b = cv.hr_ns(11);
        elseif (ns_test(i,3)>95) && (ns_test(i,3)<=100)
            phns_b = cv.hr_ns(12);
        elseif (ns_test(i,3)>100) && (ns_test(i,3)<=105)
            phns_b = cv.hr_ns(13);
        elseif (ns_test(i,3)>105) && (ns_test(i,3)<=110)
            phns_b = cv.hr_ns(14);
        elseif (ns_test(i,3)>110) && (ns_test(i,3)<=115)
            phns_b = cv.hr_ns(15);
        elseif (ns_test(i,3)>115) && (ns_test(i,3)<=120)
            phns_b = cv.hr_ns(16);
        elseif (ns_test(i,3)>120) && (ns_test(i,3)<=125)
            phns_b = cv.hr_ns(17);
        elseif (ns_test(i,3)>125) && (ns_test(i,3)<=130)
            phns_b = cv.hr_ns(18);
        elseif (ns_test(i,3)>130) && (ns_test(i,3)<=135)
            phns_b = cv.hr_ns(19);
        elseif (ns_test(i,3)>135) && (ns_test(i,3)<=140)
            phns_b = cv.hr_ns(20);
        elseif (ns_test(i,3)>140) && (ns_test(i,3)<=145)
            phns_b = cv.hr_ns(21);
        elseif (ns_test(i,3)>145) && (ns_test(i,3)<=150)
            phns_b = cv.hr_ns(22);
        elseif (ns_test(i,3)>150) && (ns_test(i,3)<=155)
            phns_b = cv.hr_ns(23);
        elseif (ns_test(i,3)>155) && (ns_test(i,3)<=160)
            phns_b = cv.hr_ns(24);
        elseif (ns_test(i,3)>160) && (ns_test(i,3)<=165)
            phns_b = cv.hr_ns(25);
        else
            phns_b = .0001;
        end
        
        stressed_score_b = sw*phs_b*pes_b*pts_b*w;
       % stressed_score = sw*pes_b*w;
        
        not_score_b = nsw*phns_b*pens_b*ptns_b*t;
        %not_score = nsw*pens_b*t;
        
        if stressed_score_b<=not_score_b
            ns_b = ns_b +1;
            %{
            history_ns(i,1) = ptns_b;
            history_ns(i,2) = pens_b;
            history_ns(i,3) = phns_b;
            history_ns(i,4) = not_score;
            history_ns(i,5) = pts_b;
            history_ns(i,6) = pes_b;
            history_ns(i,7) = phs_b;
            history_ns(i,8) = stressed_score;
            %}
        elseif not_score_b<=stressed_score_b
            s_b = s_b + 1;
            %{
            history_s(i,1) = ptns_b;
            history_s(i,2) = pens_b;
            history_s(i,3) = phns_b;
            history_s(i,4) = not_score;
            history_s(i,5) = pts_b;
            history_s(i,6) = pes_b;
            history_s(i,7) = phs_b;
            history_s(i,8) = stressed_score;
            %}
        else 
            e = e + 1;
        end

                   
end

history_ns(~any(history_ns,2),:)=[];
a_s = (s_a/total_a(1))*100;
a_ns=(ns_b/total_b(1))*100;
r_cv.stressed = a_s;
r_cv.not_stressed = a_ns;
r_cv.total = (a_s + a_ns)/2;

end
