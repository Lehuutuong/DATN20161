%27/5/2013
% Mo phong khuech tan phi tuyen,khoi phuc tin hieu mot chieu (1D)
%
% NLDF_1D
%
clc
warning off
disp(' ')
figure(1)
clf
x = square(0:0.01:6*pi); %Tao tin hieu 1D/xung vuong
plot(x)
ini_axis = axis;
ini_axis = ini_axis.*[1 1 1.2 1.2];
axis(ini_axis)
title('Tin hieu ban dau')
disp('Press any key to continue...')
pause
disp('  tac dong nhieu cong Gauss "ag" = 10%.')
disp(' ')
xn = noise(x,'ag','10%'); % tac dong nhieu cong
plot(xn,'r');
hold
plot(x,'b')
title('Tin hieu ban dau va nhieu')
disp(' ')
disp('Press any key to continue...')
pause

disp(' ')
disp('  thay nhieu cong "ag" bang nhieu nhan "mg" = 10%')
disp(' ')
xn = noise(xn,'mg','10%');%tac dong nhieu nhan
clf
plot(xn,'r');
hold
plot(x,'b')
title('tin hieu ban dau va nhieu')
disp(' ')
disp('Press any key to continue...')
pause
%Ap dung bo loc khuech tan phi tuyen cho tin hieu nhieu
n = 100;
y = nldif1(xn, .019, linspace(50,1,n), 10, linspace(.5,1000,n), n,1,3, 'scale','aos', 'grad');
disp(' ')
disp('Press any key to continue...')
pause
disp(' ')
clf
subplot(2,1,1)
plot(xn,'y')
hold
plot(x,'b');
plot(y,'r')
title('TH ban dau (xanh), Nhieu (vang), TH duoc khoi phuc (do)')
subplot(2,1,2)
plot(xn-x,'y')
hold
plot(y-x,'r')
title('Nhieu (vang) va Loi duoc khoi phuc (do)')

disp(' ')
disp('Press any key to continue...')
pause
disp('Tac dong nhieu cong Gauss "ag" = 100% ')
clf
xn = noise(x,'ag','100%');
plot(xn)
title('Tin hieu nhieu')
disp(' ')
disp('Press any key to continue...')
pause
%Ap dung bo loc khuech tan phi tuyen cho tin hieu nhieu
n = 200;
y = nldif1(xn, .019, linspace(50,1,n), 10, linspace(.5,1000,n), n,1,3, 'scale','aos', 'grad');
disp(' ')
disp('Press any key to continue...')
pause
clf
subplot(2,1,1)
plot(xn,'y')
hold
plot(x,'b');
plot(y,'r')
%axis(ini_axis)
title('TH ban dau (xanh), Nhieu (vang), TH duoc khoi phuc (do)')
subplot(2,1,2)
plot(xn-x,'y')
hold
plot(y-x,'r')
title('Nhieu (vang) va Loi duoc khoi phuc (do)')

