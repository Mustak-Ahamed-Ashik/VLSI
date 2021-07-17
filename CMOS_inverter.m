clear all;
clc;
beta=0.00024;
Vt=0.7;
Vt2=-0.7;
Vds=linspace(0,5,100);
Vds2=linspace(-5,0,100);
Vgs=linspace(1,5,5)
Vgs2=linspace(-1,-5,5);
for j=1:length(Vgs)
    for i=1:length(Vds)
        if Vgs(j)<Vt
            Ids1(i)=0;
        elseif (Vgs(j)>Vt & Vds(i)<=(Vgs(j)-Vt))
            Ids1(i)=(beta*(Vgs(j)-Vt-Vds(i)/2))*Vds(i);
        elseif ((Vgs(j)>Vt) & Vds(i)>(Vgs(j)-Vt))
            Ids1(i)=(0.5*beta)*((Vgs(j)-Vt)^2);
        end
        if Vgs2(j)>Vt2
            Ids2(i)=0;
        elseif (Vgs2(j)<Vt2 & Vds2(i)>=(Vgs2(j)-Vt2))
            Ids2(i)=(-beta*(Vgs2(j)-Vt2-Vds2(i)/2))*Vds2(i);
        elseif ((Vgs2(j)<Vt2) & Vds2(i)<(Vgs2(j)-Vt2))
            Ids2(i)=(-0.5*beta)*((Vgs2(j)-Vt2)^2);
        end
    end
    hold on;
    plot(Vds,Ids1(1:100)*1000,'LineWidth',2);
    plot(Vds2,Ids2(1:100)*1000,'LineWidth',2);
end
title('IV characterstics curve of CMOS inverter');
xlabel('Vds (volts) ');
ylabel('Ids (mA)');
ylim([-3,3]);
legend('Vgs=-5','Vgs=-4','Vgs=-3','Vgs=-2','Vgs=-1','Location','southwest');
grid on;
disp("Program run successfully for CMOS inverter IV curve");