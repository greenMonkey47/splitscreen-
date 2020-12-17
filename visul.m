clc ;clear;

path='/home/moneish/study/render/segment09/';
path2='./../variables_two/segment9';

load(path2);
list = dir(strcat(path,'*.png'));



for i=1:size(list,1)
   im=imread(strcat(path,list(i).name));
   
   a=framing(one_cwindow(i,:),1);
   b=framing(two_cwindow(i,:),1);
   imshow(im);
   if(a(3)~=0)
   rectangle('position',a,'EdgeColor','r');
   end
   if(b(3)~=0)
   rectangle('position',b,'EdgeColor','g');
   end
   % wait(10);
  pause(0.005)
  
end