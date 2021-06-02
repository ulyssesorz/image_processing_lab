%对图像进行彩色分层操作，尽量保持面部区域色彩不变，其他区域置灰，进行显示
%对图像进行彩色直方图均衡化处理，显示均衡化前、后图像

imag=imread('刘德华-毛衣.jpg');
%图像分层
R=double(imag(:,:,1));
G=double(imag(:,:,2));
B=double(imag(:,:,3));
[m,n]=size(R);
face=imag(260:300,490:650,:);%选定面部区域
rmin=min(min(face(:,:,1)));rmax=max(max(face(:,:,1)));%求所需区域的rgb范围
gmin=min(min(face(:,:,2)));gmax=max(max(face(:,:,2)));
bmin=min(min(face(:,:,3)));bmax=max(max(face(:,:,3)));
a=R>rmin&R<rmax;b=G>gmin&G<gmax;c=B>bmin&B<bmax;
k=logical(-double(a&b&c)+1);%将图像需要的颜色置1，其他置0
R(k)=205;G(k)=205;B(k)=205;%其他区域设置为灰色
imag2=imag;
imag2(:,:,1)=R;imag2(:,:,2)=G;imag2(:,:,3)=B;%合成新图像
imshow(imag2),title('分割后的图像');

%均衡化
hsi=rgb2hsi(imag);%转换为hsi
i=hsi(:,:,3);
i2=histeq(i,256);%对I分量进行均衡化
hsi(:,:,3)=i2;
rgb=hsi2rgb(hsi);
figure;imshow(rgb);title('均衡化后的图像');