%编写程序实现对R通道灰度的重新无损量化，显示重新量化后直方图
%计算输出重新量化后等长编码所需的比特数

imag=imread('22-刘德华.tif');
% figure;imshow(imag);title('原图');
R=imag(:,:,1);
figure;histogram(R,256);title('R通道的灰度值直方图');
count=unique(R); %R灰度的个数
for i = 1:8 
    if (max(mod(count, 2^i)) ~= 0)%计算冗余位数
        break;
    end
end
num=2^(i-1);
R=R/num;%对R通道进行量化
figure;histogram(R,256);title('量化后R的直方图');
n=log2(256)-log2(num)