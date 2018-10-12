clear all;



p1=load('C:\Users\Diego\Desktop\Carpeta\porePressureTXCC.out');
a1=load('C:\Users\Diego\Desktop\Carpeta\accelerationTXCC.out');
d1=load('C:\Users\Diego\Desktop\Carpeta\displacementTXCC.out');
s1=load('C:\Users\Diego\Desktop\Carpeta\stress1TXCC.out');
e1=load('C:\Users\Diego\Desktop\Carpeta\strain1TXCC.out');
s5=load('C:\Users\Diego\Desktop\Carpeta\stress4TXCC.out');
e5=load('C:\Users\Diego\Desktop\Carpeta\strain4TXCC.out')
e9=load('C:\Users\Diego\Desktop\Carpeta\strain9TXCC.out')
s9=load('C:\Users\Diego\Desktop\Carpeta\stress9TXCC.out');

fs=[0.5, 0.2, 4, 6];
fs2=[0.5, 0.2, 4, 3];
accMul = 2;

%integration point 1 p-q
po=(s1(:,2)+s1(:,3)+s1(:,4))/3;
for i=1:size(s1,1)
    qo(i)=(s1(i,2)-s1(i,3))^2 + (s1(i,3)-s1(i,4))^2 +(s1(i,2)-s1(i,4))^2 + 6.0* s1(i,5)^2;
   qo(i)=sign(s1(i,5))*1/3.0*qo(i)^0.5;
end

figure(1); close 1; figure(1);
%integration point 1 stress-strain
subplot(2,1,1), plot(e1(:,4),s1(:,5),'r');
title ('shear stress \tau_x_y VS. shear strain \epsilon_x_y at integration point 1');
xlabel('Shear strain \epsilon_x_y');
ylabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 1');
xlabel('confinement p (kPa)');
ylabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ_p1','jpg');


%integration point 5 p-q
po=(s5(:,2)+s5(:,3)+s5(:,4))/3;
for i=1:size(s5,1)
    qo(i)=(s5(i,2)-s5(i,3))^2 + (s5(i,3)-s5(i,4))^2 +(s5(i,2)-s5(i,4))^2 + 6.0* s5(i,5)^2;
   qo(i)=sign(s5(i,5))*1/3.0*qo(i)^0.5;
end

figure(5); close 5; figure(5);
%integration point 5 stress-strain
subplot(2,1,1), plot(e5(:,4),s5(:,5),'r');
title ('shear stress \tau_x_y VS. shear strain \epsilon_x_y at integration point 5');
xlabel('Shear strain \epsilon_x_y');
ylabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 5');
xlabel('confinement p (kPa)');
ylabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ_p5','jpg');

%integration point 9 p-q
po=(s9(:,2)+s9(:,3)+s9(:,4))/3;
for i=1:size(s1,1)
    qo(i)=(s9(i,2)-s9(i,3))^2 + (s9(i,3)-s9(i,4))^2 +(s9(i,2)-s9(i,4))^2 + 6.0* s9(i,5)^2;
   qo(i)=sign(s9(i,5))*1/3.0*qo(i)^0.5;
end

figure(6); close 6; figure(6);
%integration point 9 stress-strain
subplot(2,1,1), plot(e9(:,4),s9(:,5),'r');
title ('shear stress \tau_x_y VS. shear strain \epsilon_x_y at integration point 9');
xlabel('Shear strain \epsilon_x_y');
ylabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 9');
xlabel('confinement p (kPa)');
ylabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ_p9','jpg');

figure(2); close 2; figure(2);
%node 3 displacement relative to node 1
plot(d1(:,1),d1(:,4));
title ('Lateral displacement at element top');
xlabel('Time (s)');
ylabel('Displacement (m)');
set(gcf,'paperposition',fs2);
saveas(gcf,'Disp','jpg');

s=accMul*sin(0:pi/50:20*pi);
s=[s';zeros(3000,1)];
s1=interp1(0:0.01:40,s,a1(:,1));

figure(3); close 3; figure(3);
%node acceleration
a = plot(a1(:,1),s1+a1(:,6),'r');
title ('Lateral acceleration at element top');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
set(gcf,'paperposition',fs2);
saveas(gcf,'Acc','jpg');

figure(4); close 4; figure(4);
a=plot(p1(:,1),p1(:,2));
title ('Pore pressure at base');
xlabel('Time (s)');
ylabel('Pore pressure (kPa)');
set(gcf,'paperposition',fs2);
saveas(gcf,'EPWP','jpg');