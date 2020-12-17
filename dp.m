% clc;
% clear;

% This will give array and back will tells which state to be in most
% feesable .
load('./../variables_two/Ar')
load('./../variables_two/corrected_window_dos6');

l = size(two_cwindow,1);
lambda1=1;

travel = [0,lambda1;
           lambda1,0] ; 

array = zeros(length(one_cwindow),2);
back = zeros(length(one_cwindow),2);    


for i=2:l 

   a=one_cwindow(i,:);
   b=two_cwindow(i,:);
   
   overlap1_2 = (Ar*(a(3)+b(3))-norm(a(1)-b(1)))/(Ar*(a(3)+b(3))+(norm(a(1)-b(1))));
   
   c_0 = overlap1_2;
   c_1 = -1*overlap1_2;

   
   co = [c_0,c_1];
   temp =0;
   for j=1:2
       mini=inf;
       for k=1:2
            cost = array(i-1,k)+ travel(k,j)+co(j);
            if(cost<mini)
                mini=cost;
                temp=k;
            end
       end
       array(i,j)=mini;
       back(i,j)=temp;
   end
   
end
save('./../variables_two/dp','back','array');