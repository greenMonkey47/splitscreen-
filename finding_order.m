    clc;clear;

load('./../variables_two/meetsingle');

match12 = touch_11;

new_check=zeros(size(match12,1),1);

temp = find(abs(match12)==1);
new_check(temp)=1;

save('./../variables_two/new_check','new_check');
dlmwrite('./txt/check.txt',new_check);
fprintf('Done...\n');