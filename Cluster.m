clear; clc;
I = imread('GNDVI_Toma1_10m_BN_76GRAY.jpg');
Icrop = imcrop(I);
bw = im2bw(Icrop);
imshow(bw);  
Ifill = imfill(bw,'holes');
imshow(Ifill); 
Iarea = bwareaopen(Ifill,3500);
imshow(Iarea); 
boundary = bwboundaries(Iarea);
[B,L] = bwboundaries(Iarea);
% [B,L] = bwboundaries(Ifill);
% b = boundary{1};
hold on
for k = 1:length(B)
    boundary = B{k};
    imshow(Ifill); hold on; 
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
end
% imshow(Ifill); hold on; 
% plot(b(:,2),b(:,1),'g','LineWidth',3);