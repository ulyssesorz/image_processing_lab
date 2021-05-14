%读取实验数据包 “05-刘德华.tif”，完成：
%利用全局直方图均衡化增强并显示结果，能否够看出衣装品牌logo
%利用局部直方图均衡化增强并显示结果，能否够看出衣装品牌logo

%全局均衡化
imag=imread('刘德华-衣装品牌.tif');
figure;
imshow(imag);
title('原图');
figure
imhist(imag);%imhist绘制灰度直方图
title('原图像灰度直方图');
figure;
imshow(histeq(imag));%histeq进行均衡化
title('均衡化后的图像');
figure;
imhist(histeq(imag));
title('均衡化后的直方图');

%局部均衡化
[a,b,c]=size(imag);
imag2=imag;
for i=500:a-25
    for j=450:b-195 
        for k=1:3
            temp=imag2(i-24:i+24,j-24:j+24,k);
            h=imhist(temp)./numel(temp);
            c=cumsum(h);
            imag2(i,j,k)=c(temp(25,25)+1)*255;
        end
    end
end
figure;
imshow(imag2);
title('局部均衡化后的图像');

