close all
clc
clear all
prompt = {'Do you have something image in RGB colors (Y/N)?'};
dlg_title = 'Entry images';

for i11=1:1:4
                     
      [name] = uigetfile({'*.tif'},'File Selector')
        
       switch i11
           
            case 1
                
                G=histeq(imread(name));
                                
            case 2
                
                NIR=histeq(imread(name));
                                
            case 3
                
                R=histeq(imread(name));
                
             case 4
                
                REG=histeq(imread(name));
           
       end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% It deteminates the dimensions (length and width) of pictures in function
% of fly height (10m,20m...) just for 10m, 20m, 30m and 50m fly height cases
Height=input('Ingrese la altura de vuelo, 10m (10), 20m (20)...')
[w,h]=size(G);
if Height==10
    num_pix=w*h;
    m2_pix=108.05/1228800;
    m_pix=sqrt(m2_pix);
    length=w*m_pix;
    width=h*m_pix;
elseif Height==20
    num_pix=w*h;
    m2_pix=432.21/1228800;
    m_pix=sqrt(m2_pix);
    length=w*m_pix;
    width=h*m_pix;
    elseif Height==30
         num_pix=w*h;
         m2_pix=972.48/1228800;
         m_pix=sqrt(m2_pix);
         length=w*m_pix;
         width=h*m_pix; 
        elseif Height==50
                num_pix=w*h;
                m2_pix=2701.33/1228800;
                m_pix=sqrt(m2_pix);
                length=w*m_pix;
                width=h*m_pix;
end
RI = imref2d(size(G));
RI.XWorldLimits = [0 width];
RI.YWorldLimits = [0 length];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); close 1; figure(1);
imshow(G,RI);
title ('G');
xlabel('Meters');
ylabel('Meters');

RGB543=cat(3,NIR,R,G);
figure(2); close 2; figure(2);
imshow(RGB543,RI);
title ('NIR, R & G');
xlabel('Meters');
ylabel('Meters');

%%%%%%%%%%%%%%%%%%%NDVI%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G=double(G);
R=double(R);
NIR=double(NIR);

NDVI=(NIR-R)./(NIR+R);
GNDVI=(NIR-G)./(NIR+G);
RVI=R./R+NIR;

NRVI=(2*(RVI-min(min(RVI)))/(max(max(RVI))-min(min(RVI))))-1;
%Figure3
figure(3); close 3; figure(3);
imshow(NDVI,RI);
title ('NDVI');
xlabel('Meters');
ylabel('Meters');


colormap(jet);
colorbar;
%Figure4
figure(4); close 4; figure(4);
imshow(GNDVI,RI);
title ('GNDVI');
xlabel('Meters');
ylabel('Meters');

colormap(jet);
colorbar;
%Figure5
figure(5); close 5; figure(5);
imshow(NRVI,RI);
title ('NRVI');
xlabel('Meters');
ylabel('Meters');

colormap(winter);
colorbar; 

%%%%%%%%%%%%%%%%Treshold%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[w,h]=size(G);
%%acc1=input('Please input the Threshold Value=');

for i=1:w
    for j=1:h
        if NDVI(i,j)>=0.6 %$$$$$$$$$$   
            Smap1(i,j,1)=65535;
            Smap1(i,j,2)=0;
            Smap1(i,j,3)=0;
        else
            Smap1(i,j,1)=G(i,j);
            Smap1(i,j,2)=G(i,j);
            Smap1(i,j,3)=G(i,j);
        end
        SM1(i,j)=(Smap1(i,j,1)+Smap1(i,j,2)+Smap1(i,j,3))/3;
    end
end

for i=1:w
    for j=1:h
        if GNDVI(i,j)>=0.7 
            Smap2(i,j,1)=65535;
            Smap2(i,j,2)=0;
            Smap2(i,j,3)=0;
        else
            Smap2(i,j,1)=G(i,j);
            Smap2(i,j,2)=G(i,j);
            Smap2(i,j,3)=G(i,j);
        end
        SM2(i,j)=(Smap2(i,j,1)+Smap2(i,j,2)+Smap2(i,j,3))/3;
    end
end

for i=1:w
    for j=1:h
        if NRVI(i,j)>0.7
            Smap3(i,j,1)=65535;
            Smap3(i,j,2)=0;
            Smap3(i,j,3)=0;
        else
            Smap3(i,j,1)=G(i,j);
            Smap3(i,j,2)=G(i,j);
            Smap3(i,j,3)=G(i,j);
        end
        SM3(i,j)=(Smap3(i,j,1)+Smap3(i,j,2)+Smap3(i,j,3))/3;
    end
end

for i=1:w
    for j=1:h
        
            SmapT(i,j,1)=(Smap1(i,j,1)+Smap2(i,j,1)+Smap3(i,j,1));
            SmapT(i,j,2)=(Smap1(i,j,2)+Smap2(i,j,2)+Smap3(i,j,2));
            SmapT(i,j,3)=(Smap1(i,j,3)+Smap2(i,j,3)+Smap3(i,j,3));
       
    end
end
%Figure6
Smap1=uint16(Smap1);
figure(6); close 6; figure(6);
imshow(Smap1,RI);
title ('NDVI >= 0.8');
xlabel('Meters');
ylabel('Meters');

%Figure7
Smap3=uint16(Smap3);
figure(7); close 7; figure(7);
imshow(Smap3,RI);
title ('NRVI > 0.7');
xlabel('Meters');
ylabel('Meters');

%Figure8
Smap2=uint16(Smap2);
figure(8); close 8; figure(8);
imshow(Smap2,RI);
title ('GNDVI >= 0.7 ');
xlabel('Meters');
ylabel('Meters');

  


% %%
% %%%%%%%%%%segmentación de la imagen%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 1.3 The inital point is identified
% 
% sw1=inf;
% 
% while sw1>10
%     
%     prompt = {'To continue press a number greater than 10?'};
%     dlg_title = 'Entry images';
%     num_lines = 1;
%     defaultans = {'11'};
%     sw1 =str2double(inputdlg(prompt,dlg_title,num_lines,defaultans));
%     
%     if sw1>10
%         
%         fid=fopen('basura.txt','w'); 
%         I=cat(3,Smap3(:,:,1),Smap3(:,:,2),Smap3(:,:,3));
%         figure(100)
%         imshow(I);
%         [ft,ct,np]=size(I);
%         fprintf('[%0.3f,%0.3f] \n',ft,ct);
%     
%         fabric=imcrop(gcf);
%         [f,c,np]=size(fabric);
%         fprintf('[%0.3f,%0.3f] \n',f,c);
% 
%         %figure
%         %imshow(fabric)
%     
%     dx=f;
%     dy=c;
%     x1=0; y1=0;
%     %[x1, y1] = ginput(1);  %This is select a point in the image
%     x1=1;
%     y1=1;
%     y0=y1;
%     x0=x1;
%     fprintf('[%0.3f,%0.3f] \n',x1,y1);
%     
%     %Step 2: Begining the image segmentation
%     nx=round(2*(ft-x0)/f)-1;
%     ny=round(2*(ct-y0)/c)-1;
%     fprintf('[%0.3f,%0.3f] \n',nx,ny);
%     
%     sim2=0;
%     sim3=0;
%     x1=x1-dx/2;
%     
%     for i1=0:1:nx
%                
%         x1=x1+(dx/2);
%         x1=round(x1);
%         fx1=x1+(dx/2);
%         y1=y0;
%          
%         if fx1>ft
%                 
%            fx1=ft;
%            x1=ft-dx;
%            i1=nx-2;
%            
%         end
%                
%         y1=y1-(dy/2);
%         
%         for j1=0:1:ny
%                     
%             y1=y1+(dy/2);
%             fy1=y1+(dy/2);
%                                 
%             if fy1>ct
%                
%                 fy1=(ct);
%                 y1=(ct)-(dy);
%                 j1=ny-2;
%                 
%             end
%             
%             sim=0;
%             sim1=0;
%             
%             for k2=1:1:1
%                
%                 for i5=(x1+(dx/4)):1:fx1-(dx/4)
%                
%                     for j5=(y1+(dy/4)):1:(fy1-(dy/4))
% 
%                         sim1=sim1+1;     
%               
%                         if double(NDVI(round(i5),round(j5)))>0.7
% 
%                             sim=sim+1;
% 
%                         end
% 
%                     end
%                 
%                 end
%                                    
%            %A=[x1 fx1 y1 fy1 sim sim1]
%                        
%              if (sim/sim1)>0.15 
%                 
%                   sim3=sim3+1;
%                   fabric2=imcrop(I,[x1,y1,dx,dy]);
%                   fabric3=imcrop(NDVI,[x1,y1,dx,dy]);
%                   A2=size(fabric2);
%                   
%                   if A2(1)>f*0.8 && A2(2)>c*0.8
%                   
%                       figure;
%                       imshow(fabric3);
%                       colormap(jet);
%                                                             
%                    end
%                   
%                  end
%                 
%                 
%               end           
%             
%             end
%                 
%         end
%    
%     end
% end
% 
% info = imfinfo('IMG_170628_154731_0004_GRE.tif');
% info.GPSInfo
% imtool('IMG_170628_154731_0004_GRE.tif')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   

% 
% figure(9); close 9; figure(9);
% imshow(Smap1);
% title ('Colour Band NDVI >= 0.8');

im_entrada=uint8(rgb2gray(Smap3)/256);


  [m,n] = size (im_entrada);
  im_salida = ones(m,n);
  T0=76;
  T1=78;

for i=1:m
    for j = 1:n
         if(im_entrada(i,j)>T0)
             if(im_entrada(i,j)<T1)
                im_salida(i,j) = 1;

             else
                im_salida(i,j) = 0;
             end
         else
             im_salida(i,j) =0;
         end
    end
end

figure(9); close 9; figure(9);
imshow(im_salida);
title ('Binarization of Image NDVI >= 0.8');

im_salida=double(im_salida);
bw = bwareaopen(im_salida,2000);
figure(10); close 10; figure(10);
imshow(bw);
title ('Noise Reduction');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% se = strel('disk',2);
% im_cerrada= imclose(bw,se);
% figure(16); close 16; figure(16);
% imshow(im_cerrada);
% title ('Smoothing of boundaries');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
se = strel('disk',3);
bw= imclose(bw,se);
figure(16); close 16; figure(16);
imshow(bw);
title ('Smoothing of boundaries');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BW1 = bw;
%GNDVI_Toma1_10m_BN_76GRAY.jpg es el archivo con el que trabajar
figure(11); close 11; figure(11);
Icrop = imcrop(BW1);
title ('Image Crop');

BW1 = im2bw(Icrop);
Ifill = imfill(BW1,'holes');
figure(12); close 12; figure(12);
imshow(Ifill);
title ('Holes Filling');

figure(13); close 13; figure(13);
Iarea = bwareaopen(Ifill,1000);
imshow(Iarea);
title ('Noise Reduction (groups bigger than 1000px)');

[B,L,N,A] = bwboundaries(Iarea);
figure(14); close 14; figure(14);
imshow(BW1); hold on;
colors=['b' 'g' 'r' 'c' 'm' 'y'];
[xx,zz] = size (B);
% zz=length(B);
for k=1:xx
    boundary = B{k};
%     cid = int16(mod(k,length(colors))+1);
    cid = int16(mod(k,6)+1);
    plot(boundary(:,2), boundary(:,1),...
         colors(cid),'LineWidth',2);
%     randomize text position for better visibility
    rndRow = int16(xx/(mod(rand*k,7)+1));
    col = boundary(rndRow,2); row = boundary(rndRow,1);
    h = text(col+1, row-1, num2str(L(row,col)));
    set(h,'Color',colors(cid),...
        'FontSize',14,'FontWeight','bold');
    display(k)
end
title ('Clusters');
    
   