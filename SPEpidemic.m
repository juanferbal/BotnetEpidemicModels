close all 
clear all
clc

betas=0.9688;
%betas=0.01;
alphas=0.071;
epsilons=0.1174;
gammas=0.1137;
betac=0.2610;
%betac=0.1;
alphac=0.071;
epsilonc=0.1174;
gammac=0.1137;
[tb,yb]=SPSDN(betas,alphas,epsilons,gammas,betac,alphac,epsilonc,gammac);

Si=yb(:,1);
Ibi=yb(:,3);
figure(1)
plot(tb, yb)
title('SEIR model')
legend('Ss','Es','Is', 'Rs', 'Sc','Ec','Ic', 'Rc')
figure(2)
plot(Si, Ibi)
title('Si vs Ibi')


betac=0.25:0.1:0.45;
% beta variable
for i = 1:3
[tb2,yb2]=SPSDN(betas,alphas,epsilons,gammas,betac(i),alphac,epsilonc,gammac);
Ss=yb2(:,1);
Is=yb2(:,3);
figure(3)
hold on
plot(Ss,Is)
Sc=yb2(:,5);
Ic=yb2(:,7);
figure(4)
hold on
plot(Sc,Ic)
end
hold off

