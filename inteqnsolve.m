%----------------------- Initialize -----------------------%
function [y] = inteqnsolve(Xv,kernel,F)
%------- Declare Symbols ----------%
syms t x;

%-------- Number of Subintervals --------%
n = length(Xv) - 1;
Dx = 1/n;
t_v = 0:Dx/2:1;

%-------------- Calculate Coefficients -----------------%
for i = 1: 2*n+1
    b = mod(i,2);
    if(i==1 || i==(2*n+1)) 
        coef(i) = Dx/6;
    elseif(b==0) 
            coef(i) = 4*Dx/6;
    else
            coef(i) = 2*Dx/6;
    end
end

%---------- Return y ----------%
y = inteqn(t_v,kernel,F,coef);