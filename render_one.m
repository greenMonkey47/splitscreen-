clear;clc;

path='./../frames_dos6/';
path2='./../single_shot/';

l=dir(strcat(path,'*.jpg'));

load('./../variables_two/Ar')
load('./../variables_two/const_two_body_frame');     % opt_one_cwindow,opt_two_cwindow,opt_tryi12



j1=1;
j2=1;
j3=1;

one_and_two =  two_body_frame(:,1:3);

length = 1920;
width = 1080;

length_each = round(length/2);
width_each = round(length_each/Ar);


% new = zeros(size(new));
% one_new = one_cwindow;
% two_new = two_cwindow;


for i=1:size(l,1)
    i
    im = imread(strcat(path,l(i).name));
    
           a = framing(one_and_two(i,:),1);
           temp=im(a(2):a(2)+a(4),a(1):a(1)+a(3),:);
           part=imresize(temp,[2*width_each,2*length_each]);       
           new_im=part;     


    imwrite(new_im,strcat(path2,sprintf('%04d',i),'.png'));

end
