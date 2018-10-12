clear all;

a1=load('C:\Users\Diego\Desktop\Carpeta\acc');
d1=load('C:\Users\Diego\Desktop\Carpeta\disptxm');
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

%integration point 1 p-q
po=(s1(:,2)+s1(:,3)+s1(:,4))/3;
for i=1:size(s1,1)
    qo(i)=(s1(i,2)-s1(i,3))^2 + (s1(i,3)-s1(i,4))^2 +(s1(i,2)-s1(i,4))^2 + 6.0* s1(i,5)^2;
   qo(i)=sign(s1(i,5))*1/3.0*qo(i)^0.5;
end




%integration point 5 p-q
po=(s5(:,2)+s5(:,3)+s5(:,4))/3;
for i=1:size(s5,1)
    qo(i)=(s5(i,2)-s5(i,3))^2 + (s5(i,3)-s5(i,4))^2 +(s5(i,2)-s5(i,4))^2 + 6.0* s5(i,5)^2;
   qo(i)=sign(s5(i,5))*1/3.0*qo(i)^0.5;
end



%integration point 9 p-q
po=(s9(:,2)+s9(:,3)+s9(:,4))/3;
for i=1:size(s1,1)
    qo(i)=(s9(i,2)-s9(i,3))^2 + (s9(i,3)-s9(i,4))^2 +(s9(i,2)-s9(i,4))^2 + 6.0* s9(i,5)^2;
   qo(i)=sign(s9(i,5))*1/3.0*qo(i)^0.5;
end



figure(10); close 2; figure(10);
%node 3 displacement relative to node 1
plot((d1(:,6)*100),(d1(:,1)*10)+100);
title ('Stress/Deformation');
xlabel('epsilon_x_y (%)');
ylabel('Normal Stress kPa');
set(gcf,'paperposition',fs2);
saveas(gcf,'Disp','jpg');

