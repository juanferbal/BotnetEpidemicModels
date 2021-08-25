function [t,y] = ENSDN(betas,alphas,epsilons,gammas)

%betas=0.1;
%alphas=0.1;
%epsilons=0.004;
%gammas=0.015;
%betac=0.1;
%alphac=0.1;
%epsilonc=0.004;
%gammac=0.015;

function dF = epidemic(t, x);       %set up the function to be solved in a seperate function environment
    dF = zeros(4,1);
    dF(1) = -betas*x(1)*x(3)+alphas*x(4);  
    dF(2) = betas*x(1)*x(3)-epsilons*x(2);
    dF(3) = epsilons*x(2)-gammas*x(3);
    dF(4) = gammas*x(3)-alphas*x(4);
    
end

options = odeset('Refine', 10, 'RelTol', 1e-4);     %allows us to tailor ode45's options
[t,y] = ode45(@epidemic, [0 500], [0.70 0.10 0.10 0.10], options); %call ode45 to solve the model "epidemic".

end