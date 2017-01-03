% Hop cong cu loc khuech tan.
% Version 1.0    May-2013
% Hnoi University of Science and Technology
%
% /*Cac bo loc khuech tan*/
%   cedif       - Khuech tan tang cuong thich nghi.
%   ldif        - Khuech tan dang huong tuyen tinh.
%   ldifc       - Khuech tan dang huong tuyen tinh mau.
%   nldif1      - Khuech tan dang huong phi tuyen 1D.
%   nldif       - Khuech tan dang huong phi tuyen 2D.
%   nldif3      - Khuech tan dang huong phi tuyen 3D.
%   nldifc      - Khuech tan dang huong phi tuyen mau.
%   pmdif       - Khuech tan Perona & Malick.
%
% /*Cac ham ho tro (Support)*/
%   anidifstep  - Tinh toan buoc khuech tan khong dang huong.
%   aosiso1     - Tuong tac dang huong tach toan tu cong 1D.
%   aosiso      - Tuong tac dang huong tach toan tu cong.
%   conv2br     - Phep nhan chap voi lap bien 2D.
%   diffusivity - Ve cac ham khuech tan va thong luong.
%   difplot     - Ve anh duoc khuech tan.
%   difplot1    - Ve tin hieu 1D duoc khuech tan.
%   fluxplot    - Ve khuech tan va thong luong trong mot anh khuech tan.
%   fluxplot1   - Ve khuech tan va thong luong 1D trong mot anh khuech tan.
%   isodifstep1 - Tinh toan buoc khuech tan dang huong 1D.
%   isodifstep  - Tinh toan buoc khuech tan dang huong.
%   isodifstep3 - Tinh toan buoc khuech tan dang huong 3D.  
%   orideriv    - Toi uu hoa gradient anh bat bien quay.
%   gsderiv     - Dao ham duoc lam tron (smoothed) Gauss.
%   gsdplot     - Ve cac dao ham duoc lam tron Gauss.
%   stplot      - Ve tensor cau truc.
%   thomas      - Thuat toan bo giai he tuyen tinh ba duong cheo nhanh.
%
% /*Cac chuong trinh mo phong (main)*/
%   CEDIF_DEMO.m   - Mo phong khuech tan tang cuong thich nghi.
%   DIFF_DEMO.m    - Mo phong khai niem khuech tan.
%   FILTER_FIR.m   - Mo phong bo loc thong thap FIR : loc tuyen tinh
%   NLDIF_1D.m     - Mo phong khuech tan phi tuyen 1D.
%   NLDIF_DEMO1.m  - Mo phong khuech tan phi tuyen : Khai niem co ban.
%   NLDIF_DEMO2.m  - Mo phong khuech tan phi tuyen : Giam nhieu va rut gon anh.
%   NLDIF_DEMO3.m  - Mo phong khuech tan phi tuyen : Rut gon anh mau.
%
% /*Cac file anh su dung trong Mo phong*/
%   dif_hand    - Anh mot ban tay.
%   house3_1    - Anh mot ngoi nha.
%   dif_im1     - Anh hinh thap tu.
%   dif_im2     - Anh ca map.
%   plane1      - Anh may bay.
%   dif_tissue  - Anh duong ruot.
%   dif_tomography - Anh chup cat lop.
%
% /*Cac ham mo rong*/ 
%   colormapc   - Tao cac colormap vong trong.
%   conv2br     - Phep nhan chap voi lap bien 2D.
%   grow        - Mo rong mot ma tran boi lap bien.
%   noise       - Tac dong nhieu vao mot anh/ma tran.
%   roll        - Xoay hoac quay cac phan tu ma tran.
%   scale       - Dinh dang lai kich thuoc ma tran.
%