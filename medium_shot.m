clear;clc;

load('./../original_tracks/part3');              % initial tracks. (one_new,two_new,three_n)
%load('./../variables/corrected_window');  *MADE*    (one_cwindow,two_cwindow,three_cwindow)


percent_height1 = 0.45; %0.35, 0.45
percent_height2 = 0.45 ; 
center_height1 = 0.45;   %0.35 , 0.45
center_height2 = 0.45 ;
one_cwindow = [one_new(:,1)+(one_new(:,3))/2,(one_new(:,2)+center_height1*one_new(:,4)),percent_height1*one_new(:,4)];
two_cwindow = [two_new(:,1)+(two_new(:,3))/2,(two_new(:,2)+center_height2*two_new(:,4)),percent_height2*two_new(:,4)];

% 
% two_cwindow(1:120,2) =  two_cwindow(1:120,2) -15;

w1=0.8;
w2=0.8;

h1=0.19;
h2=0.19;

temp1=[one_new(:,1),one_new(:,2),one_new(:,1)+w1*one_new(:,3),one_new(:,2)+h1*one_new(:,4)];

temp2=[two_new(:,1),two_new(:,2),two_new(:,1)+w2*two_new(:,3),two_new(:,2)+h2*two_new(:,4)];

save('./../variables_two/part1','one_cwindow','two_cwindow','temp1','temp2');
Ar=1.77;
save('./../variables_two/Ar','Ar');
fprintf('Done...Ditector_to_window\n');
