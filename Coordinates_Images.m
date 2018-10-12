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

Height=input('Ingrese la altura de vuelo, 10m (10), 20m (20)...')
[w,h]=size(G);
if Height==10
    num_pix=w*h;
    m2_pix=108.05/1228800;
    m_pix=sqrt(m2_pix);
    length=w*m_pix;
    width=h*m_pix;
elseif Heightt==20
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

figure; imshow(G,RI);