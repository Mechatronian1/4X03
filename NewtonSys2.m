%---------------- Program Start -------------------%
clear
format long
%-------- Initialize starting values and desired end point --------%
a0 = 0.7;
B0 = 0.7;
d1  = 5;
d2  = 6;
p = 10;
q = 4;
iterations = 0;

%-------------- Create Intial Matrices -----------------%
x = [a0; B0];
y = [0; 0];
F = [0; 0];
Jac = [0 0; 0 0];

%-------- Stop iterations when difference < StopVal --------%
StopVal = 0.01;
Dx = 1;
%----------- Calculation Loop----------%
while (Dx > StopVal)
    x0 = x(1);
    %---------- Main Equations ----------%
    %F function
    F(1,1) = -(d1*cos(x(1)) + d2*cos(x(1)+x(2)) - p);
    F(2,1) = -(d1*sin(x(1)) + d2*sin(x(1)+x(2)) - q);
    %Jacobian
    Jac(1,1) = (-5*sin(x(1)))-(6*sin(x(1)+x(2)));
    Jac(1,2) = -6*sin(x(1)+x(2));
    Jac(2,1) = 5*cos(x(1))+6*cos(x(1)+x(2));
    Jac(2,2) = 6*cos(x(1)+x(2));

    %----------- Calculations ----------%
    y = inv(Jac)*(F);
    x = x+y;
    
    %------ Increase iteration count -------%
    iterations = iterations + 1;
      
    %-------- Halt Loop When Desired Accuracy is Reached ---------%
    Dx = abs(x(1) - x0);
    
    %-------------------Put data into matrix for display --------%
    disp_out(iterations,1) = iterations;
    disp_out(iterations,2) = x(1);
    disp_out(iterations,3) = x(2);
    disp_out(iterations,4) = Dx;    

end
disp_out
