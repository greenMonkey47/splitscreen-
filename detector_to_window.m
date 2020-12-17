
clc;clear;

    load('./../original_tracks/tracks_dos6.mat');

si =size(Actor_tracks(1).bbox,1);

%temp= randi([-10,10],si,4);
temp1 = Actor_tracks(1).bbox;

%temp= randi([-10,10],si,4);
temp2 = Actor_tracks(2).bbox;
   
%-----------------------------------------------------------------------------
tep1 = temp1;
tep2 = temp2;

va1=[(tep1(:,1)+tep1(:,3))/2,(tep1(:,2)+tep1(:,4))/2,tep1(:,4)-tep1(:,2),tep1(:,3)-tep1(:,1)];
va2=[(tep2(:,1)+tep2(:,3))/2,(tep2(:,2)+tep2(:,4))/2,tep2(:,4)-tep2(:,2),tep2(:,3)-tep2(:,1)];


si=size(tep1,1);

t= randi([-10,10],si,2);
va1(:,1:2)=va1(:,1:2)+t;

t= randi([-10,10],si,2);
va1(:,3:4)=va1(:,3:4)+t;

t= randi([-10,10],si,2);
va2(:,1:2)=va2(:,1:2)+t;

t= randi([-10,10],si,2);
va2(:,3:4)=va2(:,3:4)+t;

l=size(va1,1);
nu= randi([-100,100],50,1);
fra = randi([1,l],50,1);
o=ones(l,1);
o(fra) = o(fra).*nu;
va1=va1+[o,o,ones(l,1),ones(l,1)];

nu= randi([-100,100],50,1);
fra = randi([1,l],50,1);
o=ones(l,1);
o(fra) = o(fra).*nu;
va2=va2+[o,o,ones(l,1),ones(l,1)];


cep1=[va1(:,1)-va1(:,4)/2,va1(:,2)-va1(:,3)/2,va1(:,1)+va1(:,4)/2,va1(:,2)+va1(:,3)/2];
cep2=[va2(:,1)-va2(:,4)/2,va2(:,2)-va2(:,3)/2,va2(:,1)+va2(:,4)/2,va2(:,2)+va2(:,3)/2];

temp1=cep1;
temp2=cep2;

% cep1=0;
% cep2=0;
%-----------------------------------------------------------------------------------------------------


one_cwindow = [(temp1(:,1)+temp1(:,3))/2,temp1(:,2)+((temp1(:,4)-temp1(:,2))*1.4/2),(temp1(:,4)-temp1(:,2))*2.3/2]; %(two-blue,one-red,three-green)
two_cwindow = [(temp2(:,1)+temp2(:,3))/2,temp2(:,2)+((temp2(:,4)-temp2(:,2))*1.4/2),(temp2(:,4)-temp2(:,2))*2.3/2]; %1.4,2.5--3.6,4.9

%one_cwindow(:,1:2)=one_cwindow(:,1:2)+100;

one_cwindow =one_cwindow(1:end-1,:);
two_cwindow =two_cwindow(1:end-1,:);
figure,plot(one_cwindow(:,1),'r')
hold on ;

onen =one_cwindow;
twon =two_cwindow;

set( findobj(gca,'type','line'), 'LineWidth', 5);

temp= randi([-1,1],size(one_cwindow,1),2);

 l=size(one_cwindow,1);
% nu= randi([-50,50],3,2);
% o=ones(l,1);
% o(1:floor(l/3))=o(1:floor(l/3))*nu(1,1);
% o(floor(l/3)+1:floor(2*l/3))=o(floor(l/3)+1:floor(2*l/3))*nu(2,1);
% o(floor(2*l/3)+1:end)=o(floor(2*l/3)+1:end)*nu(3,1);
% t=ones(l,1);
% t(1:floor(l/3))=t(1:floor(l/3))*nu(1,2);
% t(floor(l/3)+1:floor(2*l/3))=t(floor(l/3)+1:floor(2*l/3))*nu(2,2);
% t(floor(2*l/3)+1:end)=t(floor(2*l/3)+1:end)*nu(3,2);
% temp = [o,t];

% nu= randi([-150,150],50,1);
% fra = randi([1,l],50,1);
% o=ones(l,1);
% o(fra) = o(fra).*nu;
% temp=temp+[o,o];
% 
% one_cwindow(:,1:2) = one_cwindow(:,1:2)+temp;
% 
% temp= randi([-40,40],size(one_cwindow,1),2);

% nu= randi([-50,50],3,2);
% o=ones(l,1);
% o(1:floor(l/3))=o(1:floor(l/3))*nu(1,1);
% o(floor(l/3)+1:floor(2*l/3))=o(floor(l/3)+1:floor(2*l/3))*nu(2,1);
% o(floor(2*l/3)+1:end)=o(floor(2*l/3)+1:end)*nu(3,1);
% t=ones(l,1);
% t(1:floor(l/3))=t(1:floor(l/3))*nu(1,2);
% t(floor(l/3)+1:floor(2*l/3))=t(floor(l/3)+1:floor(2*l/3))*nu(2,2);
% t(floor(2*l/3)+1:end)=t(floor(2*l/3)+1:end)*nu(3,2);
% temp = [o,t];

% nu= randi([-150,150],50,1);
% fra = randi([1,l],50,1);
% o=ones(l,1);
% o(fra) = o(fra).*nu;
% temp=temp+[o,o];
% 
% two_cwindow(:,1:2) = two_cwindow(:,1:2) +temp;

plot(one_cwindow(:,1),'b')


save('./../variables_two/corrected_window_dos6','one_cwindow','two_cwindow','onen','twon','cep1','cep2');
save('./../variables_two/original_window_dos6','temp1','temp2');
Ar =1.77;%0.88(for full shot in 1902/1080),1.77()
save('./../variables_two/Ar','Ar');
fprintf('Done...Ditector_to_window\n');