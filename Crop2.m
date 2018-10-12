prompt = {'Do you have something image in RGB colors (Y/N)?'};
dlg_title = 'Entry images';
[name] = uigetfile({'*.tiff'},'File Selector')
D=imread(name);
figure(1); close 1; figure(1);
imshow(D);
title ('Colour Band');

[Icrop,r] = imcrop(D);

imshow(Icrop)
saveas(gcf,'GREcrop99','tiffn')
% print('-dtiff','-r2500','GREcrop55')