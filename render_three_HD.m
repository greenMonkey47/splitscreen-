clear;clc;

path='./../frames_dos6/';
path2='./../ff/2_long/';

l=dir(strcat(path,'*.jpg'));

load('./../variables_two/Ar')
load('./../variables_two/corrected_window_dos6');  %corrected_window_dos4
load('./../variables_two/two_body_frame');     % opt_one_cwindow,opt_two_cwindow,opt_tryi12
load('./../variables_two/one_Shots');     
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

top = width - width_each ;
i=1;
top
im = imread(strcat(path,l(i).name));
imshow(im);
num = input('top-y\n');

% new = zeros(size(new));
% one_new = one_cwindow;
% two_new = two_cwindow;

for i=520:850 %size(new,1)
    i
    im = imread(strcat(path,l(i).name));
    im1= im;
    %-----------------------------------------------------------------------------
    temp=framing(one_new(i,:),1) ;
    if(twon(i,3)~=0)
    
   im1=make_rect_im(im1,temp,0,0,255);
    end

    
    temp=framing(two_new(i,:),1);
    if(twon(i,3)~=0)
    
   im1=make_rect_im(im1,temp,0,0,255);
     end
    
    %-------------------------------------------------------------------------------------
       new_im=im;    
    new_im(1:top,:,:)=im1(num+1:num+top,:,:);
    new_im(top-5:top,:,:)=211;
   
   if(new(i,1)==0) %when all are single 
        
        a=framing(one_new(i,:),1);    %person1 
        b=framing(two_new(i,:),1);    %person2
        
        if(one_new(i,1)>two_new(i,1))
            c=a;
            a=b;
            b=c;
        end
        
        if(a(3)>0&&a(2)>0&&a(2)+a(4)<size(im,1)&&a(1)>0&&a(1)+a(3)<size(im,2))     
            temp=im(a(2):a(2)+a(4),a(1):a(1)+a(3),:);
            part1=imresize(temp,[width_each,length_each]);
            new_im(top+1:end,1:length_each,:)=part1;
        else
            new_im(top+1:end,1:length_each,:)=0;
        end
        new_im(top+1:end,length_each-10:length_each,:)=255 ;
        new_im(top+1:end,length_each-5:length_each,:)=0 ;
        
         %boy
        if(b(3)>0&&b(2)>0&&b(2)+b(4)<size(im,1)&&b(1)>0&&b(1)+b(3)<size(im,2))       
            temp=im(b(2):b(2)+b(4),b(1):b(1)+b(3),:);
            part2=imresize(temp,[width_each,length_each]);      
            new_im(top+1:end,length_each+1:2*length_each,:)=part2;
        %imshow(new_im);
        else
            new_im(top+1:end,length_each+1:2*length_each,:)=0;
        end  
        %new_im(701:end,635:640,:)=211;
   
     
   else 
       if(new(i,1)==1)
           a = framing(one_and_two(i,:),2);
           temp=im(a(2):a(2)+a(4),a(1):a(1)+a(3),:);
           part=imresize(temp,[width_each,2*length_each]);
           new_im(top+1:end,1:2*length_each,:)=part;
       end       
    end

    imwrite(new_im,strcat(path2,sprintf('%04d',i),'.png'));

end
