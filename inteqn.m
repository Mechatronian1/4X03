%----------------------- Initialize -----------------------%
function y = inteqn(tv,kernel,F,coef)
%------- Declare Symbols ----------%
syms t x
K=0;
n = length(tv);

%---------- Calculate Coefficients --------%
for j = 1:n
    for i= 1:n
     K(j,i) = coef(i)*subs(kernel,{x,t},{tv(j),tv(i)});
    end
end

for i=1:n
    fv(i) = subs(F,x,tv(i));
end

%------ Generate identity matrix --------%
I = eye(n);
%-------- identity - kernel --------------%
invers = (I-K);
y = invers\fv';
