clear;clc;

path='E:\CVIT\honors\images\all\frames_dos3\';
path2='E:\CVIT\honors\images\all\output_photo\initial_test3\';

l=dir(strcat(path,'*.jpg'));

load('./../variables_two/Ar')
load('./../variables_two/corrected_window_dos6');  %corrected_window_dos4
load('./../variables_two/two_body_frame');   
load('./../variables_two/one_Shots');  % opt_one_cwindow,opt_two_cwindow,opt_tryi12
load('./../variables_two/new_check');

new = new_check;

j1=1;
j2=1;
j3=1;

one_and_two =  opt_tryi12(:,1:3);

one_new = opt_one_cwindow;
two_new = opt_two_cwindow;

length = 1920;
width = 1080;

length_each = round(length/2);
width_each = round(length_each/Ar);

% new = zeros(size(new));
% one_new = one_cwindow;
% two_new = two_cwindow;
%one_and_two= two_body_frame;
r1=[];
r2=[];
r3=[];
R1=[];
R2=[];
R3=[];


for i=1:size(new,1)
     
        a=one_new(i,:);    %person1 
        b=two_new(i,:);    %person2
        c =one_and_two(i,:);
        
        a1=one_cwindow(i,:);    %person1 
        b1=two_cwindow(i,:);    %person2
        c1 = two_body_frame(i,:);
          
         r1=vertcat(r1,a1);
         r2=vertcat(r2,b1);  
         r3=vertcat(r3,c1);  
    
        

         R1=vertcat(R1,a);
         R2=vertcat(R2,b);  
         R3=vertcat(R3,c);  
        

end
k=find(new==1);
f= figure;
        
length=0.5;
length2=2;
 hold on
 
         plot(R1(1:k(1)+5,1),'r','LineWidth',length2)
        plot(R2(1:k(1)+5,1),'b','LineWidth',length2)
        plot([k(1)+5:size(R3,1)],[R3(k(1)+5:end,1)],'y','LineWidth',length2)
        
%         plot(r1(1:k(1),1),'k','LineWidth',length)       
%         plot(r2(1:k(1),1),'k','LineWidth',length)
%         plot([k(1):size(r3,1)],[r3(k(1):end,1)],'k','LineWidth',length)
%         
%         
        
       
        hx = graph2d.constantline(k(1)+5, 'LineStyle',':', 'Color',[.5 .5 .5]);
changedependvar(hx,'x');
%set(f, 'Position', [200, 200, 1685, 250]);
axis off
