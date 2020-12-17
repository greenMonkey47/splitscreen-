clc
%clear
 path ='./../frames_video1/';
 out ='./../lot1/';
 
 load('./variables/corrected_window2');
 load('./variables/one_Shots');
 load('./variables/Ar')
 
temp= randi([-50,50],size(one_cwindow,1),2);
one_cwindow(:,1:2) = one_cwindow(:,1:2)+temp;
temp= randi([-20,20],size(one_cwindow,1),1);
one_cwindow(:,3) = one_cwindow(:,3)+temp;

temp= randi([-50,50],size(one_cwindow,1),2);
two_cwindow(:,1:2) = two_cwindow(:,1:2) +temp;
temp= randi([-20,20],size(one_cwindow,1),1);
two_cwindow(:,3) = two_cwindow(:,3) +temp;

temp= randi([-50,50],size(one_cwindow,1),2);
three_cwindow(:,1:2) =three_cwindow(:,1:2)+temp;
temp= randi([-20,20],size(one_cwindow,1),1);
three_cwindow(:,3) =three_cwindow(:,3)+temp;
 
 
 onen=opt_one_cwindow;
 twon=opt_two_cwindow;
 threen=opt_three_cwindow;

list=dir(strcat(path,'*.jpg'));



a=[16,236,345,444,723,872];


for i=338:size(one_cwindow,1)
    i
        
    im = imread(strcat(path,list(i).name));
    
    temp=framing(one_cwindow(i,:),1,Ar);
    if(one_cwindow(i,3)~=0)
        im=make_rect_im(im,temp,255,0,0);
    end
    %-----------------------------------------------------------------------
    
    temp=framing(onen(i,:),1,Ar);
    if(twon(i,3)~=0)
    
   im=make_rect_im(im,temp,0,0,255);
    end
    
    temp=framing(two_cwindow(i,:),1,Ar);
    if(two_cwindow(i,3)~=0)
        im=make_rect_im(im,temp,255,0,0);
    end
    %-----------------------------------------------------------------------
    
    temp=framing(twon(i,:),1,Ar);
    if(twon(i,3)~=0)
    
   im=make_rect_im(im,temp,0,0,255);
    end

    
     temp=framing(three_cwindow(i,:),1,Ar);
    if(three_cwindow(i,3)~=0)
        im=make_rect_im(im,temp,255,0,0);
    end
    %-----------------------------------------------------------------------
    
    temp=framing(threen(i,:),1,Ar);
    if(threen(i,3)~=0)
    
   im=make_rect_im(im,temp,0,0,255);
    end


    im = im(1:end,1:end,:);

    imwrite(im,strcat(out,sprintf('%04d',i),'.png'));
 %   print(strcat(out,sprintf('%04d',i)),'-dpng');

end