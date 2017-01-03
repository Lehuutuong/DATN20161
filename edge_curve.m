function IMOUT = edge_curve(X)
% I5 = rgb2gray(X);%chuyen anh chi so ve mau xam
 I = mat2gray(X);
% imshow(I); %bieu dien hình 1 
% I1 = imadjust(I,stretchlim(I),[0,1]);%dieu chinh cac gia tri diem anh, do tuong phan va mau sac co the thay doi dc , thiet lap nguong dieu chinh tu dong
% % figure; 
% % imshow(I1); % bieu dien hinh 2
% title('Anh xam dau vao');
[N,M] = size(I);  % xac dinh so hang so cot cua ma tran anh
 
h = [0.125,0.375,0.375,0.125]; %ma tran hang
g = [0.5,-0.5]; %ma tran hang
delta = [1,0,0]; 
J = 2; % so muc phan ra
 a(1:N,1:M,1,1:J+1) = 0; %ma tran 4 chieu 


dx(1:N,1:M,1,1:J+1) = 0; 
dy(1:N,1:M,1,1:J+1) = 0; 
d(1:N,1:M,1,1:J+1) = 0; 
 
a(:,:,1,1) = conv2(h,h,I,'same'); 
dx(:,:,1,1) = conv2(delta,g,I,'same'); 
dy(:,:,1,1) = conv2(g,delta,I,'same'); 
 
x = dx(:,:,1,1); 
y = dy(:,:,1,1); 
d(:,:,1,1) = sqrt(x.^2+y.^2); %tinh toan gradient
I1 = imadjust(d(:,:,1,1),stretchlim(d(:,:,1,1)),[0 1]);figure;imshow(I1); 
 
lh = length(h); 
lg = length(g); 
 
for j = 1:J+1 
    lhj = 2^j*(lh-1)+1; 
    lgj = 2^j*(lg-1)+1; 
    hj(1:lhj)=0; 
    gj(1:lgj)=0; 
for n = 1:lh 
    hj(2^j*(n-1)+1)=h(n); 
end 
 
for n = 1:lg 
    gj(2^j*(n-1)+1)=g(n); 
end 
 
a(:,:,1,j+1) = conv2(hj,hj,a(:,:,1,j),'same'); 
dx(:,:,1,j+1) = conv2(delta,gj,a(:,:,1,j),'same'); 
dy(:,:,1,j+1) = conv2(gj,delta,a(:,:,1,j),'same'); 
 
x = dx(:,:,1,j+1); 
y = dy(:,:,1,j+1); 
dj(:,:,1,j+1) = sqrt(x.^2+y.^2); 
 
IMOUT = imadjust(dj(:,:,1,j+1),stretchlim(dj(:,:,1,j+1)),[0 1]);
figure;imshow(IMOUT); %cac bien anh o cac muc phan ra sau hon
title('Anh da tach bien' );
end