%27/5/2013
% Mo phong khuech tan phi tuyen voi qua trinh nhiet
%
% NLDIF_DEMO1.
%
clc
clf
%fig = gcf;
fig = 1;
figure(fig)
clf
colormap(gray(256))
b = zeros(1,100);
b(1:75) = 255;
image(b);
title('Thong so nhiet do tren thanh kim loai')
xlabel('nong = sang     lanh = toi')
disp('Ap dung khuech tan tuyen tinh ')
disp('Press any key to continue...')
pause

y = ldif(b,linspace(1,10,150),150,fig,20);%Bo loc khuech tan tuyen tinh

disp('Bay gio chung ta ap dung bo loc khuech tan phi tuyen de thay su khac biet ')
disp('Press any key to continue...')
pause
b = zeros(2,100);
b(:,1:75) = 255;
y = nldif(b,4,0.1,16,.2,50,fig,20,'dfstep',500); %Bo loc khuech tan phi tuyen

disp('Tiep theo tac dong them nhieu va xem ket qua ')
disp('Press any key to continue...')
pause
b = zeros(50,100);
b(:,1:75) = 255;
bn = noise(b,'ag','50%');% Tac dong nhieu Gauss = 50%
clf
colormap(gray(256))
image(bn)
title('Thong so nhiet do tren thanh kim loai - Nhieu Gauss 50%')
xlabel('nong = sang     lanh = toi')
disp('Ap dung bo loc khuech tan phi tuyen va xem ket qua ')
disp('Press any key to continue...')
pause

y = nldif(bn,15,2.5,16,2,20,fig,3, 'aos');%Bo loc khuech tan phi tuyen

disp('De thay ro su anh huong cua cac tham so chung ta quan sat gradientva khuech tan cua anh sau buoc thu 20')
disp('tham so sigma bat dau tang va lambda bat dau giam.')
disp(' ')
disp('Press any key to continue...')
pause

y = nldif(bn,15,2.5,12,2,1,fig,1,'grad', 'flux', 'aos');%Bo loc khuech tan phi tuyen
figure(fig+1)
colormap(hot(256))
figure(fig+2)
colormap(hot(256))
disp('press any key to see result...')
pause

y = nldif(bn,[linspace(10,10,20) linspace(20,50,20)],[linspace(2.5,2.5,20) linspace(2,.01,20)],12,2,40,fig,2,'grad', 'flux', 'aos');