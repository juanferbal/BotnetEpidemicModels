close all 
clear all
clc

betas=0.506;
alphas=0.0055;
epsilons=1/11.08;
gammas=1/14.97;
[tb,yb]=ENSDN(betas,alphas,epsilons,gammas);

Si=yb(:,1);
Ibi=yb(:,3);

Scale=1;
h_Fig=figure('PaperPositionMode', 'manual','PaperUnits','inches','PaperPosition',[0 0 3.5*2 3.5*2/1.618*Scale],'Position',[1000 150 800 800/1.618*Scale]);
ax=gca;

plot(tb, yb,'-','linewidth',2)
box on
xlabel ('Time Index');
ylabel ('Fraction of Population');
grid on;
legend('Ss','Es','Is', 'Rs')
set(gca,'fontsize',12,'Gridlinestyle','--');
set(gca,'LooseInset',get(gca,'TightInset'),'fontsize',14);
%Filename='EntMod_Ro_pos';
%print(h_Fig, '-depsc','-r600',Filename)
%print(h_Fig, '-dpng','-r600',Filename)


betas=0.3:0.2:0.7;

% beta variable
h_Fig2=figure('PaperPositionMode', 'manual','PaperUnits','inches','PaperPosition',[0 0 3.5*2 3.5*2/1.618*Scale],'Position',[1000 150 800 800/1.618*Scale]);
ax=gca;


xlabel ('Percentage of S_{s} [%]');
ylabel ('Percentage of I_{s} [%]');
grid on;
set(gca,'fontsize',12,'Gridlinestyle','--');
set(gca,'LooseInset',get(gca,'TightInset'),'fontsize',14);

for i = 1:3
[tb2,yb2]=ENSDN(betas(i),alphas,epsilons,gammas);
Ss=yb2(:,1);
Es=yb2(:,2);
Is=yb2(:,3);
Rs=yb2(:,4);
hold on
plot(Ss,Is,'-','linewidth',2,'Color',ax.ColorOrder(i,:))

end
box on
%%
%Filename='EnMod_SsvsIs';
%print(h_Fig, '-depsc','-r600',Filename)
%print(h_Fig, '-dpng','-r600',Filename)
hold off

n=size(yb,1);

yb4=int16(round(yb,2)*100);
point1=rand(1,n);
point2=rand(1,n);
states=zeros(100,1);

h_Fig4=figure('PaperPositionMode', 'manual','PaperUnits','inches','PaperPosition',[0 0 3.5*2 3.5*2/1.618*Scale],'Position',[1000 150 800 800/1.618*Scale]);
ax=gca;

k=1;

test=[1 87 140 261];
for j=1:2
    %hold on
    S=yb4(test(j),1);
    E=yb4(test(j),2);
    I=yb4(test(j),3);
    R=yb4(test(j),4);
    subplot(1,2,k)
    hold on
    grid on
    set(gca,'XColor','none','YColor','none','TickDir','out')
    axis([-0.05 1.05 -0.05 1.1])
    titlevar=sprintf('System at t_{%i}', int16(tb(test(j))));
    title(titlevar,'fontsize',18)
    set(gca,'LooseInset',get(gca,'TightInset'),'fontsize',18);
    states(1:S)=1;
    states(S+1:S+E)=2;
    states(S+E+1:S+E+I)=3;
    states(S+E+I+1:S+E+I+R)=4;
    hold on
    plot(point1(states == 1),point2(states ==1), 'ob', 'LineWidth', 1, 'MarkerFaceColor', 'b')
    plot(point1(states == 2),point2(states ==2), '+', 'LineWidth', 1, 'LineWidth',1.5,'MarkerFaceColor',[0.8500 0.3250 0.0980],'MarkerEdgeColor',[0.8500 0.3250 0.0980])
    plot(point1(states == 3),point2(states ==3), '*r', 'LineWidth', 1, 'MarkerFaceColor', 'r')
    plot(point1(states == 4),point2(states ==4), 's', 'LineWidth', 1, 'MarkerFaceColor',[0.4660 0.6740 0.1880], 'MarkerEdgeColor',[0.4660 0.6740 0.1880])
    legend('S', 'E', 'I','R','Orientation','horizontal', 'fontweight', 'bold')
    k=k+1;
end

hold off

h_Fig5=figure('PaperPositionMode', 'manual','PaperUnits','inches','PaperPosition',[0 0 3.5*2 3.5*2/1.618*Scale],'Position',[1000 150 800 800/1.618*Scale]);
ax=gca;

for j=3:4
    %hold on
    S=yb4(test(j),1);
    E=yb4(test(j),2);
    I=yb4(test(j),3);
    R=yb4(test(j),4);
    subplot(1,2,k-2);
    hold on
    grid on
    set(gca,'XColor','none','YColor','none','TickDir','out')
    axis([-0.05 1.05 -0.05 1.1])
    titlevar=sprintf('System at t_{%i}', int16(tb(test(j))));
    title(titlevar,'fontsize',18)
    set(gca,'LooseInset',get(gca,'TightInset'),'fontsize',18);
    states(1:S)=1;
    states(S+1:S+E)=2;
    states(S+E+1:S+E+I)=3;
    states(S+E+I+1:S+E+I+R)=4;
    hold on
    plot(point1(states == 1),point2(states ==1), 'ob', 'LineWidth', 1, 'MarkerFaceColor', 'b')
    plot(point1(states == 2),point2(states ==2), '+', 'LineWidth', 1, 'LineWidth',1.5,'MarkerFaceColor',[0.8500 0.3250 0.0980],'MarkerEdgeColor',[0.8500 0.3250 0.0980])
    plot(point1(states == 3),point2(states ==3), '*r', 'LineWidth', 1, 'MarkerFaceColor', 'r')
    plot(point1(states == 4),point2(states ==4), 's', 'LineWidth', 1, 'MarkerFaceColor',[0.4660 0.6740 0.1880], 'MarkerEdgeColor',[0.4660 0.6740 0.1880])
    legend('S', 'E', 'I','R','Orientation','horizontal', 'fontweight', 'bold')
    k=k+1;
end

hold off