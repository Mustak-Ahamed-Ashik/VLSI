clear all;
clc;
beta=0.000240;
Vt2=-0.7;
Vds2=linspace(0,-5,100);
Vgs2=linspace(0,-5,6);
for j=1:length(Vgs2)
    for i=1:length(Vds2)
        if Vgs2(j)>Vt2
            Ids2(i)=0;
        elseif (Vgs2(j)<Vt2 & Vds2(i)>=(Vgs2(j)-Vt2))
            Ids2(i)=(-beta*(Vgs2(j)-Vt2-Vds2(i)/2))*Vds2(i);
        elseif ((Vgs2(j)<Vt2) & Vds2(i)<(Vgs2(j)-Vt2))
            Ids2(i)=(-0.5*beta)*((Vgs2(j)-Vt2)^2);
        end
    end
    hold on;
    plot(Vds2,Ids2(1:100)*1000,'LineWidth',2);
end
title('Linear region equation plot I-V curve of PMOS');
xlabel('Vds ');
ylabel('Ids (mA) ');
ylim([-3,0]);
legend('Vgs=-4','Vgs=-3','Vgs=-2','Vgs=-1','Vgs=0','Location','southeast');
grid on;