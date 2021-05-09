%1、分别显示RGB三通道
%2、输出R通道最大值、G通道最小值、B通道均值
%3、将“01-刘德华.jpg”重取样成358×441（身份证照）像素大小、
%并显示和存储成jpg格式重量化成3比特图像，

imag=imread('刘德华_证件照.jpg');
channel1=imag;
channel2=imag;
channel3=imag;

%设置通道
channel1(:,:,2)=0;
channel1(:,:,3)=0;
channel2(:,:,1)=0;
channel2(:,:,3)=0;
channel3(:,:,1)=0;
channel3(:,:,2)=0;

%绘图
subplot(1,3,1);
imshow(channel1);
title('R通道图像');
subplot(1,3,2);
imshow(channel2);
title('G通道图像');
subplot(1,3,3);
imshow(channel3);
title('B通道图像');

%R的最大值
R_max=max(max(channel1))
%G的最小值
G_min=min(min(channel2))

%B的均值
[r,l]=size(channel3);
channel3=double(channel3);
sum=0;
for i=1:r
    for j=1:l
        sum=sum+channel3(i,j);
    end
end
B_mean=sum/(r*l)

%重采样
imag2=imresize(imag,[441,358]);
figure;
imshow(imag2);
title('358*441图像');
size(imag2)

%重量化
imag3=fix(imag/32)*32;
% imwrite(imag3,'量化后的图像.jpg','jepg');
figure;
imshow(imag3)
title('量化后的图像');

