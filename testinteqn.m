%--------------------- Program Start ----------------------%
clear;
format long;
%----------------------- Initialize -----------------------%
syms t x ;
kernel = 1/(1+t) - x;
F_correct = (1+x)^-2;

%--------------- Function ---------------%
F = (4*x^3 + 5*x^2 -2*x + 5)/(8*(x+1)^2);

%-------- Number of Subintervals --------%
n = 10;  

Dx = 1/n;
Xv = 0:Dx:1;

%---------- Get Coefficients -----------%
a = inteqnsolve(Xv,kernel,F);
Y = a(1:2:2*n+1);

%-------------- Plot Graphs ----------------%
plot(Xv,Y);
hold on;
fplot (F_correct,[0,1]);
hold off;

for i=1:n+1
    yreal(i,1) = subs(F_correct,x,Xv(i));
end

for i=1:n+1
    norm = (yreal(i,1)-Y(i))^2;
end

%--------- Display Statement -------%
disp('norm of the difference')
eval(norm)