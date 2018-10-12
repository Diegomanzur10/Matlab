prompt = {'Do you have something image in RGB colors (Y/N)?'};
dlg_title = 'Entry images';
[name] = uigetfile({'*.png'},'File Selector')
D=imread(name);
figure(1); close 1; figure(1);
imshow(D);
title ('Colour Band');


D_R=D(:,:,1);
figure(2); close 2; figure(2);
imshow(D_R);
title ('No Red Band');

D_BN=rgb2gray(D);
figure(3); close 3; figure(3);
imshow(D_BN);
title ('Black and White Scale');

im_entrada=rgb2gray(D);

% figure(4); close 4; figure(4);
% imshow(D);
% title ('D');

  [m,n] = size (im_entrada);
  im_salida = ones(m,n);
  T0=75;
  T1=77;

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
figure(5); close 5; figure(5);
imshow(im_salida);
title ('im-salida');

se = strel('disk',2);
im_cerrada= imclose(im_salida,se);
figure(6); close 6; figure(6);
imshow(im_cerrada);
title ('im-cerrada');

im_cerrada=double(im_cerrada);
bw = bwareaopen(im_cerrada,30);
figure(7); close 7; figure(7);
imshow(bw);
title ('bw');