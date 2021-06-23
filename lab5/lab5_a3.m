%对图像进行邻域平均法平滑处理，显示平滑前、后图像
%对图像进行拉普拉斯锐化处理，显示锐化前、后图像

imag=imread('刘德华-格子.jpg');
figure;imshow(imag);title('原图');
%均值滤波
h=fspecial('average',3);%均值滤波模板
imag2=imfilter(imag,h,'replicate');
figure;imshow(imag2);title('均值滤波后的图像');

%拉普拉斯滤波
h2=fspecial('laplacian',0.2);%拉普拉斯模板
i=imfilter(imag,h2,'replicate');
imag3=imag-i;
figure;imshow(imag3);title('拉普拉斯滤波后的图像');