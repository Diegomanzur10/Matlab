BW = imread('GNDVI_Toma1_10m_BN_76GRAY.jpg');
%GNDVI_Toma1_10m_BN_76GRAY.jpg es el archivo con el que trabajar
figure(1); close 1; figure(1);
Icrop = imcrop(BW);
title ('Image Crop');

BW = im2bw(Icrop);
Ifill = imfill(BW,'holes');
figure(2); close 2; figure(2);
imshow(Ifill);
title ('Holes Filling');

figure(3); close 3; figure(3);
Iarea = bwareaopen(Ifill,1000);
imshow(Iarea);
title ('Noise Reduction');

[B,L,N,A] = bwboundaries(Iarea);
figure(4); close 4; figure(4);
imshow(BW); hold on;
colors=['b' 'g' 'r' 'c' 'm' 'y'];
for k=1:length(B)
    boundary = B{k};
    cidx = int16(mod(k,length(colors))+1);
    plot(boundary(:,2), boundary(:,1),...
         colors(cidx),'LineWidth',2);
    %randomize text position for better visibility
    rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
    col = boundary(rndRow,2); row = boundary(rndRow,1);
    h = text(col+1, row-1, num2str(L(row,col)));
    set(h,'Color',colors(cidx),...
        'FontSize',14,'FontWeight','bold');
end
title ('Clusters');

% figure; spy(A);