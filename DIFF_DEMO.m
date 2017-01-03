%27/5/2013
% Mo phong Khai niem khuech tan
%
%DIFF_DEMO
%
clc
figure(1)
clf
%Xet su anh huong cua lambda trong tinh toan thong luong va khuech tan
diffusivity(10,2)
disp('Press any key to continue...')
pause

figure(1)
clf
diffusivity([10,20],2) 
disp('Press any key to continue...')
pause

figure(1)
clf
%Xet su anh huong cua m
diffusivity(20,[2,4])%lambda = 20 va m = 2 and 4
disp(' Xet su anh huong cua tham so m. Co dinh lambda =20/ thay doi m = 2,4,20 .')
disp(' ')
disp('Press any key to continue...')
pause
figure(1)
clf
diffusivity(20,[2,4,20])