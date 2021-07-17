clear all;
clc;
beta=0.00024;
Vt=0.7;
Vds=linspace(0,5,100);
Vgs=linspace(1,5,5);
for j=1:length(Vgs);
    for i=1:length(Vds)
        if Vgs(j)<Vt
            Ids1(i)=0;
        elseif (Vgs(j)>Vt & Vds(i)<=(Vgs(j)-Vt))
            Ids1(i)=(beta*(Vgs(j)-Vt-Vds(i)/2))*Vds(i);
        elseif ((Vgs(j)>Vt) & Vds(i)>(Vgs(j)-Vt))
            Ids1(i)=(0.5*beta)*((Vgs(j)-Vt)^2);
        end
        if Vgs(j)<Vt
            Ids2(i)=0;
        elseif (Vgs(j)>Vt & Vds(i)<=(Vgs(j)-Vt))
            Ids2(i)=(beta*(Vgs(j)-Vt-Vds(i)/2))*Vds(i);
        elseif ((Vgs(j)>Vt) & Vds(i)>(Vgs(j)-Vt))
            Ids2(i)=(0.5*beta)*((Vgs(j)-Vt)^2);
        end
    end
    hold on;
    plot(Vds,(Ids1(1:100))*1000,'LineWidth',2);
    plot(flip(Vds),Ids2(1:100)*1000,'LineWidth',2);
end
title('Load line analysis of CMOS inverter');
xlabel('Vout (volts) ');
ylabel('Ids (mA)');
grid on;
disp("Program run successfully for CMOS inverter load line");