clear all;
clc;
beta=0.000240;
Vt=0.7;
Vds=linspace(0,5,100);
Vgs=linspace(0,5,6);
for j=1:length(Vgs)
    for i=1:length(Vds)
        if Vgs(j)<Vt
            Ids1(i)=0;
        elseif (Vgs(j)>Vt & Vds(i)<=(Vgs(j)-Vt))
            Ids1(i)=(beta*(Vgs(j)-Vt-Vds(i)/2))*Vds(i);
        elseif ((Vgs(j)>Vt) & Vds(i)>(Vgs(j)-Vt))
            Ids1(i)=(0.5*beta)*((Vgs(j)-Vt)^2);
        end
    end
    hold on;
    plot(Vds,Ids1(1:100)*1000,'LineWidth',2);
end
title('Plot I-V curve of NMOS');
xlabel('Vds (volts) ');
ylabel('Ids (mA) ');
ylim([0,3]);
legend('Vgs=0','Vgs=1','Vgs=2','Vgs=3','Vgs=4','Location','northwest');
grid on;