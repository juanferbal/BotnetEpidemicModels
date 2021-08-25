function [t,y] = SPSDN(betas,alphas,epsilons,gammas,betac,alphac,epsilonc,gammac)

%betas=0.1;
%alphas=0.1;
%epsilons=0.004;
%gammas=0.015;
%betac=0.1;
%alphac=0.1;
%epsilonc=0.004;
%gammac=0.015;

function dF = epidemic(t, x);       %set up the function to be solved in a seperate function environment
    dF = zeros(8,1);
%    dF(1) = -betas*x(1)*(x(7)+x(3))+alphas*x(4);  
    dF(1) = -betas*x(1)*x(7)+alphas*x(4);  
%    dF(2) = betas*x(1)*(x(7)+x(3))-epsilons*x(2);
    dF(2) = betas*x(1)*x(7)-epsilons*x(2);
    dF(3) = epsilons*x(2)-gammas*x(3);
    dF(4) = gammas*x(3)-alphas*x(4);
    dF(5) = -betac*x(5)*x(7)+alphac*x(8);  
    dF(6) = betac*x(5)*x(7)-epsilonc*x(6);
    dF(7) = epsilonc*x(6)-gammac*x(7);
    dF(8) = gammac*x(7)-alphac*x(8);
end

options = odeset('Refine', 10, 'RelTol', 1e-4);     %allows us to tailor ode45's options
[t,y] = ode45(@epidemic, [0 1000], [0.55 0.15 0.15 0.15 0.55 0.15 0.15 0.15], options); %call ode45 to solve the model "epidemic".

end