function in3 = test_vectors3(in)
% "in" should be ks_testX or kns_testX
% X being a number 1 through 10
% manually delete the last line of cv_test.txt

% left shift by 4 and make binary

in2 = (in.*64)';
in3 = dec2bin(in2,14);


fileID = fopen('cv_test.txt','w');

for n=1:(200000-2)
    fprintf(fileID,'%s\n',in3(n,:));
end
fclose(fileID);


end
