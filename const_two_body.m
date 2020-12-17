clc;clear;

%load('./../variables_two/pchip_all');              % initial tracks. (one_n,two_n,three_n)
load('./../variables_two/corrected_window_dos6');       % medium shot.    (one_cwindow,two_cwindow,three_cwindow) %corrected_window_dos4
load('./../variables_two/Ar');
                           %outputs
%two_body_frame                                % N x 3 vector (for [one,two] only )
%three_body_frame                              % N x 3 vector (for [one,two,three]) *not there*

tryi12 = zeros(size(one_cwindow,1),3);         %temp variables_two.

H =one_cwindow(1,3)*4;


for i=1:size(one_cwindow,1)                    
    
    a = framing(one_cwindow(i,:),1);
    b = framing(two_cwindow(i,:),1);

    if(a(3)~=0 && b(3)~=0)
        y=min(a(1),b(1));
        j = max(a(1)+a(3),b(1)+b(3));
        h=(j-y)/Ar;
        if(h<H)
            h=H;
        end
        centerx = one_cwindow(i,1)+two_cwindow(i,1);    
        centery = one_cwindow(i,2)+two_cwindow(i,2); 
        tryi12(i,:) = [centerx/2,centery/2,h/2];
    else
        centerx = one_cwindow(i,1)+two_cwindow(i,1); 
        centery = one_cwindow(i,2)+two_cwindow(i,2);
        tryi12(i,:) = [centerx/2,centery/2,0];
    end
          
end

opt_tryi12 = cvx_optimisation_three_body(tryi12(:,1:3),800,0,800);
two_body_frame = opt_tryi12;

save('./../variables_two/const_two_body_frame','two_body_frame');

fprintf('Done...two_body_frames\n');