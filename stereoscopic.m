% Irectified= imread('image.jps');
% redChannel = Irectified(:, :, 1);
% imwrite(redChannel, 'trai.jpg');
% disp('Done and written as trai.jpg');
% cyanChannel= Irectified(:, :, 2);
% imwrite(cyanChannel, 'phai.jpg');
% disp('Done and written as phai.jpg');

clc
im1_path = which('dif_im1.jpg');%Load anh
im1 = imread(im1_path); %Doc anh dau vao
figure(1)
clf
image(im1)
colormap(gray(256))
colorbar
title('Anh ban dau')
xlabel('Khong nhieu')
disp(' ')
disp('Press any key to continue...')
pause
figure(2)
clf
colormap(gray(256))
im1n = noise(im1,'ag','25%');%Tac dong nhieu Gauss 25%
imagesc(im1n);
title('Anh nhieu')
xlabel('Nhieu Gauss 25%')
colorbar
disp('Press any key to continue...')
pause
 y = ldif(im1n,12,5,2,'imscale');
%  y = nldif(im1n,[linspace(3,15,40) linspace(15,15,10)],[linspace(4,1,40) linspace(1,1,10)],12,10,50,2,4,'dfstep',4,'aos','imscale');
disp(' ')
disp('Press any key to continue...')
pause

  y = nldif(im1n,[linspace(3,15,40) linspace(15,15,10)],[linspace(4,1,40) linspace(1,1,10)],12,10,50,2,4,'dfstep',4,'aos','imscale');
disp(' ')
disp(' Tiep tuc tang muc do nhieu len 50% VA XEM KET QUA')
disp(' ')
disp('Press any key to continue...')
pause
%Ap dung bo loc khuech tan phi tuyen
y = nldif(noise(im1,'ag','50%'),[linspace(3,15,40) linspace(15,15,10)],[linspace(4,1,40) linspace(1,1,10)],12,10,50,2,4,'dfstep',4,'aos','imscale');

disp(' ')
disp(' Bay gio tac dong nhieu Gauss 100%.')
disp(' ')
disp('Press any key to continue...')
pause
%Ap dung bo loc khuech tan phi tuyen
y = nldif(noise(im1,'ag','100%'),[linspace(3,15,40) linspace(15,15,10)],[linspace(4,1,40) linspace(1,1,10)],12,10,50,2,4,'dfstep',4,'aos','imscale');

disp('Bay gio chung ta khao sat qua trinh tach bien ')
disp('Press any key to continue...')
pause
clear im1
% im2_path = which('trai.jpg');
% im2_path = which('map.jpg');
I22 = imread('demo.PNG');
I2 = rgb2gray(I22);
I2noise = noise(I2,'ag','10%');%Tac dong nhieu Gauss 40%
% I = mat2gray(I2);

y = nldif(I2noise,[linspace(2,3,10) linspace(3.5,3.75,40)],[linspace(1,1,10) linspace(1,1,40)],20,linspace(100,1000,50),50,2,3,'aos','grad', 'dfstep',2);
IMOUT = edge_curve(I2);


% y = nldif(im2,4,1,12,linspace(10,100,14),14,2,1,'aos','grad', 'dfstep', 3);
% 
% disp(' ')
% disp('Press any key to continue...')
% pause
% 
% y = nldif(im2,[linspace(2,3,10) linspace(3.5,3.75,40)],[linspace(1,1,10) linspace(1,1,40)],20,linspace(100,1000,50),50,2,3,'aos','grad', 'dfstep',2);
% 
% disp(' ')
% disp(' ')
% 
% 

