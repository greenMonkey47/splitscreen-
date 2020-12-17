clc;clear;

%load('./../variables_two/pchip_all');              % initial tracks. (one_n,two_n,three_n)
load('./../variables_two/corrected_window_dos6');       % medium shot.    (one_cwindow,two_cwindow,three_cwindow) %corrected_window_dos4
load('./../variables_two/Ar');
                           %outputs
%two_body_frame                                % N x 3 vector (for [one,two] only )
%three_body_frame                              % N x 3 vector (for [one,two,three]) *not there*

tryi12 = zeros(size(one_cwindow,1),3);         %temp variables_two.

width = 1920;
for i=1:size(two_cwindow,1)                    
    i
    a = framing(one_cwindow(i,:),1);
    b = framing(two_cwindow(i,:),1);
    
    if(a(1)<1)
        a(3)=0;
    end
    
    if(b(1)<1)
       b(3)=0;
    end
   
     if(a(1)+a(3)>width)
        a(3)=0;
     end

    if(b(1)+b(3)>width)
        b(3)=0;
    end
    
    if(a(3)~=0 && b(3)~=0)
        y=min(a(2),b(2));
        
        if(a(2)+a(4)>b(2)+b(4))
            psudo=a(2)+a(4);
        else
            psudo=b(2)+b(4);
        end
        h=(psudo-y )/2;                  %
        centerx = one_cwindow(i,1)+two_cwindow(i,1);    
        centery = one_cwindow(i,2)+two_cwindow(i,2); 
        tryi12(i,:) = [centerx/2,centery/2,h];
    else
        centerx = one_cwindow(i,1)+two_cwindow(i,1); 
        centery = one_cwindow(i,2)+two_cwindow(i,2);
        tryi12(i,:) = [centerx/2,centery/2,0];
    end
          
end

two_body_frame = tryi12;

save('./../variables_two/two_body_frame','two_body_frame');
fprintf('Done...two_body_frames\n');