function frame=framing(temp,mul)

%makes it to rectangle co-ordinates.
%Input(temp) is in the form of [x,y,s] and multiplication factor of the Ar.
frame= [0,0,0,0];
load('./../variables_two/Ar');


frame(2)=temp(2)-temp(3);
frame(1)=temp(1)-temp(3)*Ar*mul;
frame(3) = 2*temp(3)*Ar*mul;
frame(4) =2*temp(3);
frame=round(frame);

return 