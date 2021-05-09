%1、读取实验数据包里面“03-刘德华.jpg”，
%提取出自拍照里面的天空背景，将其替换成“03-大海背景.jpg”

imag=imread('刘德华_自拍照.jpg');
imag2=imread('大海背景.jpg');

R=imag(:,:,1);%rgb三通道
G=imag(:,:,2);
B=imag(:,:,3);
%改变背景的rgb范围
R(R<57)=0;
G(G<96)=0;
B(B<152)=0;
c=R&G&B;
se=strel('disk',5);%直径为5的结构元素
i2=imopen(c,se);%开运算
i3=[i2==0];
imag3=double(imag2).*i2+double(imag).*i3;%图像合成
imshow(mat2gray(imag3));
title('刘德华-大海图像');