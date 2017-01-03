%27/5/2013
% Mo phong khuech tan tang cuong thich nghi
%
%CEDIF_DEMO.m
%
clc
clf
fig = 1;
figure(fig)
colormap(gray(256))
b = zeros(100,100);
b(:,1:75) = 255;
b(30:70,50:100) = 0;
image(b);
%Tac dong nhieu Gauss = 25%
%Ap dung bo loc khuech tan tang cuong thich nghi
y = cedif(noise(b,'ag','25%'),5,1,3,10,.24,150,1,10,'struc', 'grad', 'dfstep',10);
disp(' ')
disp('Press any key to continue...')
pause

im1_path = which('dif_im1.jpg');%load anh
im1 = imread(im1_path); %doc anh dua vao
%Tac dong nhieu Gauss 50%
%Ap dung bo loc khuech tan tang cuong thich nghi cho anh nhieu
y = cedif(noise(im1,'ag','50%'),1.5,4,1,10,.24,50,1,1,'dfstep',25,'imscale', 'grad', 'struc');

