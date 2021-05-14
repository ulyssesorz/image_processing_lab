%读取实验数据包“06-刘德华.jpg”，完成：
%对图像的R通道数据进行空间平滑滤波（滤波器和滤波参数自选），显示滤波结果
%利用拉普拉斯锐化滤波器对上述平滑滤波结果进行锐化，显示锐化结果

%均值滤波
imag=imread('刘德华-无间道.jpg');
[r,l]=size(imag);
l=l/3;
imag=imag(:,:,3);%R通道
figure;
imshow(imag);
title('原图')
imag2=imag;
for i=1:r
    for j=1:l
        up=max(i-1,1);
        down=min(i+1,r);
        left=max(j-1,1);
        right=min(j+1,l);
        imag2(i,j)=mean(mean(imag(up:down,left:right)));
    end
end
figure;
imshow(imag2,[]);
title('均值滤波后的结果')
% mo=ones(10);
% imag2=imfilter(imag,mo,'replicate');

%拉普拉斯滤波
imag2=im2double(imag2);
mo2=fspecial('laplacian');%拉普拉斯模板
g=imfilter(imag2,mo2,'replicate');%滤波
figure;
imshow(g,[]);
title('标定后的图像')
imag3=imag2-g;
figure;
imshow(imag3,[]);
title('拉普拉斯滤波后的图像');
        
