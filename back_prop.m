clear;clc;
%from dp: back and array area saved 

load('./../variables_two/dp');
lp = size(back,1);
new=zeros(lp,1);
k=find(array(lp,:)==min(array(lp,:)));
new(lp)=k(1)-1;  % -1 because in states are 0, but for loop in dp starts form 1
for i=1:lp
    if(back(lp-i+1,k)==0)
        break;
    end
    next = back(lp-i+1,k)-1;
    new(lp-i)=next;
    k=next+1;
end

save('./../variables_two/new','new');
dlmwrite('./txt/check.txt',new);
%save new**