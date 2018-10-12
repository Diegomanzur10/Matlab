clear all;

a1=load('C:\Users\Diego\Desktop\Carpeta\accelerationTXC.out');
d1=load('C:\Users\Diego\Desktop\Carpeta\displacementTXC.out');
s1=load('C:\Users\Diego\Desktop\Carpeta\stress1TXC.out');
e1=load('C:\Users\Diego\Desktop\Carpeta\strain1TXC.out');
s5=load('C:\Users\Diego\Desktop\Carpeta\stress9TXC.out');
e5=load('C:\Users\Diego\Desktop\Carpeta\strain9TXC.out');

fs=[0.5, 0.2, 4, 6];

%integration point 1 p-q
po=(s1(:,2)+s1(:,3)+s1(:,4))/3;
for i=1:size(s1,1)
    qo(i)=(s1(i,2)-s1(i,3))^2 + (s1(i,3)-s1(i,4))^2 +(s1(i,2)-s1(i,4))^2 + 6.0* s1(i,5)^2;
    qo(i)=sign(s1(i,5))*1/3.0*qo(i)^0.5;
end
figure(13); clf;
%integration point 1 stress-strain
subplot(2,1,1), plot(e1(:,4),s1(:,5),'r');
title ('Integration point 1 shear stress \tau_x_y VS. shear strain \epsilon_x_y');
xlabel('Shear strain \epsilon_x_y');
ylabel('Shear stress \tau_x_y (kPa)');

subplot(2,1,2), plot(-po,qo,'r');
title ('Integration point 1 confinement p VS. deviatoric q relation');
xlabel('confinement p (kPa)');
ylabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ1','jpg');

%integration point 3 p-q
po=(s5(:,2)+s5(:,3)+s5(:,4))/3;
for i=1:size(s5,1)
    qo(i)=(s5(i,2)-s5(i,3))^2 + (s5(i,3)-s5(i,4))^2 +(s5(i,2)-s5(i,4))^2 + 6.0* s5(i,5)^2;
    qo(i)=sign(s5(i,5))*1/3.0*qo(i)^0.5;
end

figure(14); clf;
%integration point 3 stress-strain
subplot(2,1,1), plot(e5(:,4),s5(:,5),'r');
title ('Integration point 3 shear stress \tau_x_y VS. shear strain \epsilon_x_y');
xlabel('Shear strain \epsilon_x_y');
ylabel('Shear stress \tau_x_y (kPa)');

subplot(2,1,2), plot(-po,qo,'r');
title ('Integration point 3 confinement p VS. deviatoric q relation');
xlabel('confinement p (kPa)');
ylabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ5','jpg');

figure(15); clf;
%node 3 displacement relative to node 1
subplot(2,1,1),plot(d1(:,1),d1(:,6),'r');
title ('Lateral displacement at element top');
xlabel('Time (s)');
ylabel('Displacement (m)'); 
set(gcf,'paperposition',fs);
saveas(gcf,'D','jpg');