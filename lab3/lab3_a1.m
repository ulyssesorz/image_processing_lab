%R通道灰度图像进行二维傅里叶变换，显示变换后频率谱和相角，根据需要进行增强和移位显示
%利用R通道的频率谱和G通道的相角重建灰度图像并显示

imag=imread('刘德华-无间道.jpg');
imag_g=imag;%备用
imag(:,:,2)=0;
imag(:,:,3)=0;
imag=rgb2gray(imag);%转为灰度图像
imag=im2double(imag);
figure;imshow(imag,[]);title('R通道灰度图');

f=fft2(imag);%二维傅里叶变换
ft=fftshift(f);%经过调整的傅里叶变换
margin=log(abs(ft)+1);%对幅度进行对数变换增强
phase=angle(ft);%相位谱
figure;imshow(margin,[]);title('幅度谱');
figure;imshow(phase,[]);title('相位谱');

imag_g(:,:,1)=0;
imag_g(:,:,3)=0;
imag_g=rgb2gray(imag_g);
imag_g=im2double(imag_g);
f2=fft2(imag_g);%对G通道进行变换
x=abs(f);%R通道幅度
y=angle(f2);%G通道相位
i=x.*cos(y)+x.*sin(y).*i;
imag2=abs(ifft2(i));%反变换
figure;imshow(imag2,[]);title('重建后的图像');
