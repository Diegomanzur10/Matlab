clear all;

a1=load('C:\Users\Diego\Desktop\Carpeta\acc');
d1=load('C:\Users\Diego\Desktop\Carpeta\disp');
p1=load('C:\Users\Diego\Desktop\Carpeta\pwp');
s1=load('C:\Users\Diego\Desktop\Carpeta\stress1');
e1=load('C:\Users\Diego\Desktop\Carpeta\strain1');
s5=load('C:\Users\Diego\Desktop\Carpeta\stress5');
e5=load('C:\Users\Diego\Desktop\Carpeta\strain5');
s9=load('C:\Users\Diego\Desktop\Carpeta\stress9');
e9=load('C:\Users\Diego\Desktop\Carpeta\strain9');

% Example9
% a1=load('C:\Users\Diego\Desktop\Carpeta\acce.out');
% d1=load('C:\Users\Diego\Desktop\Carpeta\disp.out');
% s1=load('C:\Users\Diego\Desktop\Carpeta\stress1.out');
% e1=load('C:\Users\Diego\Desktop\Carpeta\strain1.out');
% s5=load('C:\Users\Diego\Desktop\Carpeta\stress3.out');
% e5=load('C:\Users\Diego\Desktop\Carpeta\strain3.out');


fs=[0.5, 0.2, 4, 6];
fs2=[0.5, 0.2, 4, 3];
accMul = 2;



%integration point 5 p-q
po=(s5(:,2)+s5(:,3)+s5(:,4))/3;
for i=1:size(s5,1)
    qo(i)=(s5(i,2)-s5(i,3))^2 + (s5(i,3)-s5(i,4))^2 +(s5(i,2)-s5(i,4))^2 + 6.0* s5(i,5)^2;
   qo(i)=sign(s5(i,5))*1/3.0*qo(i)^0.5;
end

figure(5); close 5; figure(5);
%integration point 5 stress-strain
subplot(2,1,1), plot(e5(:,4)*10,s5(:,5)*10,'r');
title ('Axial Strain \epsilon (% VS. Desviatoric Stress q (kPa) point 5');
xlabel('Axial Strain \epsilon (%)');
ylabel('Desviatoric Stress q (kPa)');
subplot(2,1,2), plot(-po*10,qo*10,'r');
title ('Effective confinement p´ (kPa) VS. Desviatoric Stress q (kPa) point 5');
xlabel('Effective confinement p´ (kPa)');
ylabel('Desviatoric Stress q (kPa)');
set(gcf,'paperposition',fs);
saveas(gcf,'SS_PQ_p5','jpg');




