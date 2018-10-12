clear all;

a1=load('acc');
d1=load('disp');
p1=load('pwp');
s1=load('stress1');
e1=load('strain1');
s5=load('stress5');
e5=load('strain5');
s9=load('stress9');
e9=load('strain9');

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
xLabel('Shear strain \epsilon_x_y');
yLabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 1');
xLabel('confinement p (kPa)');
yLabel('q (kPa)');
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
xLabel('Shear strain \epsilon_x_y');
yLabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 5');
xLabel('confinement p (kPa)');
yLabel('q (kPa)');
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
xLabel('Shear strain \epsilon_x_y');
yLabel('Shear stress \tau_x_y (kPa)');
subplot(2,1,2), plot(-po,qo,'r');
title ('confinement p VS. deviatoric stress q at integration point 9');
xLabel('confinement p (kPa)');
yLabel('q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ_p9','jpg');

figure(2); close 2; figure(2);
%node 3 displacement relative to node 1
plot(d1(:,1),d1(:,6));
title ('Lateral displacement at element top');
xLabel('Time (s)');
yLabel('Displacement (m)');
set(gcf,'paperposition',fs2);
saveas(gcf,'Disp','jpg');

s=accMul*sin(0:pi/50:20*pi);
s=[s';zeros(3000,1)];
s1=interp1(0:0.01:40,s,a1(:,1));

figure(3); close 3; figure(3);
%node acceleration
a = plot(a1(:,1),s1+a1(:,6),'r');
title ('Lateral acceleration at element top');
xLabel('Time (s)');
yLabel('Acceleration (m/s^2)');
set(gcf,'paperposition',fs2);
saveas(gcf,'Acc','jpg');

figure(4); close 4; figure(4);
a=plot(p1(:,1),p1(:,2));
title ('Pore pressure at base');
xLabel('Time (s)');
yLabel('Pore pressure (kPa)');
set(gcf,'paperposition',fs2);
saveas(gcf,'EPWP','jpg');