%1、读取实验数据包里面“02-刘德华.jpg”，完成对该图像的二值化（0、255）处理，
%要求二值化后0和255值像素点数目约各占一半。输出二值化门限值，并显示二值化图像

imag=imread('刘德华_演唱会.jpg');

imag2=imag(:);%向量化以便求中值
mid=median(imag2);%中值，即灰度门限
imag(imag<mid)=0;%按门限划分二值
imag(imag>mid)=255;
imshow(imag);
title('二值图');
length(find(imag==0))
length(find(imag==255))