clear;clc;

load('./../variables_two/Ar');
load('./../variables_two/corrected_window_dos6');                         %corrected_window_dos4
load('./../variables_two/two_body_frame');
load('./../variables_two/original_window_dos6');

opt_tryi12 = cvx_optimisation_three_body(two_body_frame(:,1:3),400,0,500);             %one and two.

both = zeros(size(one_cwindow,1),1);
touch_11 = zeros(size(one_cwindow,1),1);
touch_22 = zeros(size(one_cwindow,1),1);

for i=1:size(two_cwindow,1) %*338:*all three have not come
    
    a=framing(one_cwindow(i,:),1);
    b=framing(two_cwindow(i,:),1);
    
    d_center = one_cwindow(i,1)-two_cwindow(i,1);                          					%-ve if two is on the right
    len = (a(3)+b(3))/2;   
    if(len>abs(d_center))
        if(d_center==0)
            touch_11(i)=1;
            continue;
        end
       touch_11(i)=sign(d_center);
    end
  
    
end

one_two = find(touch_11==1);
%  load('./../variables_two/new'); %new
%  
%  t = find(new==0);
% touch_11(t)=0;

load('./../variables_two/new')
touch_11(find(new==0))=0; 

match12 = zeros(size(one_cwindow,1),1);

for i=2:size(touch_11)
    if(touch_11(i)~=touch_11(i-1))  
        if(abs(touch_11(i)) > abs(touch_11(i-1)))
   
                op=touch_11(i,1);
        else
                op=touch_11(i-1,1);
        end
        
         match12(i,1)=op;
    end

end

jk1=find(abs(match12)==1);

jk1=jk1(1);
% jk1 = 1;

save('./../variables_two/meetsingle','touch_11');

one_cwindow_both=zeros(size(one_cwindow,1),3);
two_cwindow_both=zeros(size(one_cwindow,1),3);

one_cwindow_both(jk1,:) = [opt_tryi12(jk1,1)+(match12(jk1).*opt_tryi12(jk1,3))*Ar*2/2,opt_tryi12(jk1,2),opt_tryi12(jk1,3)]; %one has to undergo it twice.
two_cwindow_both(jk1,:) = [opt_tryi12(jk1,1)-(match12(jk1).*opt_tryi12(jk1,3))*Ar*2/2,opt_tryi12(jk1,2),opt_tryi12(jk1,3)];


% jk1(1:2) = 1311;
opt_one_cwindow = cvx_optimisation_two_body(one_cwindow,one_cwindow_both,jk1,2000,0,3000,temp1);

opt_two_cwindow = cvx_optimisation_two_body(two_cwindow,two_cwindow_both,jk1,2000,0,3000,temp2);

save('./../variables_two/one_Shots','opt_one_cwindow','opt_two_cwindow','opt_tryi12')

dlmwrite('./txt/one.txt',opt_one_cwindow);
dlmwrite('./txt/two.txt',opt_two_cwindow);
dlmwrite('./txt/both.txt',opt_tryi12);
    
   fprintf('Done...meet2..only\n');