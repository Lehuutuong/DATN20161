%27/5/2013
%Thiet ke bo l?c FIR thong thap/bo loc tuyen tinh
clc
warning off
figure(1)
clf
x = square(0:0.01:6*pi); % Tin hieu 1D, xung vuong
plot(x)
ini_axis = axis;
ini_axis = ini_axis.*[1 1 1.2 1.2];
axis(ini_axis)
title('Tin hieu ban dau')
disp('Press any key to continue...')
pause
% hold off
xn = noise(x,'mg','25%'); % Tac dong nhieu Gauss
plot(xn,'r');
hold
plot(x,'b')
title('Tin hieu ban dau (xanh) va nhieu (do)')
disp('Press any key to continue...')
pause
windowSize = 100; %Kich thuoc cua so bo loc
y= filter(ones(1,windowSize)/windowSize,1,xn) % Bo loc tuyen tinh
hold off
plot(y,'k');
