function opt_vector = cvx_optimisation_two_body(array,ideal,mark,lambda1,lambda2,lambda3,temp)

N = size(array,1);
e = ones(N,1);
D1 = spdiags([-e e], 0:1, N-1, N);
D2 = spdiags([e -2*e e], 0:2, N-2, N);
D3 = spdiags([-e 3*e -3*e e], 0:3, N-3, N);

% thresh1 = 50;
% thresh2 = 50;
% thresh3 = 50;

loose=1;
relax=1;
load('./../variables_two/Ar');

cvx_begin 
variable x(N,1) %x in usual sense
variable y(N,1) %y
variable h(N,1) %height

minimise(0.5*sum_square(x(1:N)-(array(:,1)))+ 0.5*sum_square(y(1:N)-(array(:,2)))...
+ 0.5*sum_square(h(1:N)-(array(:,3))) ...
+ lambda1*norm(D1*x,1)  + lambda3*norm(D3*x,1)...
+ lambda1*norm(D1*y,1) + lambda3*norm(D3*y,1)...
+ lambda1*norm(D1*h,1) + lambda3*norm(D3*h,1)...
)

subject to
    
    x(mark) == ideal(mark,1);
    y(mark) == ideal(mark,2);
    h(mark) == ideal(mark,3);    
    
%     x-loose*Ar*h <= temp(:,1); % constrants to make sure the prfoemer head is not cropped from the shot.
%     x+relax*Ar*h >= temp(:,3);
%     y-loose*h <= temp(:,2);
%     y+relax*h >= temp(:,4);
cvx_end

opt_vector=horzcat(x,y,h);

return

end