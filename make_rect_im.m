function [im]=make_rect_im(im,temp,r,g,b)

        thick=5;

       im(temp(2):temp(2)+temp(4),temp(1):temp(1)+thick,1)=r;
       im(temp(2):temp(2)+temp(4),temp(1):temp(1)+thick,2)=g;
       im(temp(2):temp(2)+temp(4),temp(1):temp(1)+thick,3)=b;
       
       im(temp(2):temp(2)+thick,temp(1):temp(1)+temp(3),1)=r;
       im(temp(2):temp(2)+thick,temp(1):temp(1)+temp(3),2)=g;
       im(temp(2):temp(2)+thick,temp(1):temp(1)+temp(3),3)=b;
       
       im(temp(2):temp(2)+temp(4),temp(1)+temp(3):temp(1)+temp(3)+thick,1)=r;
       im(temp(2):temp(2)+temp(4),temp(1)+temp(3):temp(1)+temp(3)+thick,2)=g;
       im(temp(2):temp(2)+temp(4),temp(1)+temp(3):temp(1)+temp(3)+thick,3)=b;
       
       im(temp(2)+temp(4):temp(2)+temp(4)+thick,temp(1):temp(1)+temp(3)+thick,1)=r;
       im(temp(2)+temp(4):temp(2)+temp(4)+thick,temp(1):temp(1)+temp(3)+thick,2)=g;
       im(temp(2)+temp(4):temp(2)+temp(4)+thick,temp(1):temp(1)+temp(3)+thick,3)=b;
       
end