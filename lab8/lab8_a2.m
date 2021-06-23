%对R通道进行DCT变换，仅保留变换后直流分量，显示反变换结果
%对R通道进行DCT变换，保留变换后64×64个系数，显示反变换结果
%将R通道划分为若干8×8大小子块，每块做DCT变换，保留直流分量，显示反变换后结果

imag=imread('23-刘德华.jpg');
% figure;imshow(imag);title('原图');
R=double(imag(:,:,1));
dct_r=dct2(R);%对R通道dct变换

%仅保留变换后直流分量
dct_1=zeros(size(dct_r));
dct_1(1)=dct_r(1);%保留直流分量
R_1=idct2(dct_1);
figure;imshow(R_1/255);title('仅保留直流分量的结果');

%保留变换后64×64个系数
dct_2=zeros(size(dct_r));
dct_2(1:64,1:64)=dct_r(1:64,1:64);
R_2=idct2(dct_2);
figure;imshow(R_2/255);title('保留64×64个系数的结果');

%划分为若干8×8大小子块，每块做DCT变换，保留直流分量
R_3=R;
dct_3=zeros(8,8);
for i = 1: 8: m-7
    for j = 1:8: n-7
        t = dct2(R(i:i+7, j:j+7));%每个子块做dct变换
        dct_3(1,1) = t(1,1);%保留直流
        R_3(i:i+7, j:j+7) = idct2(dct_3);
    end
end 
figure;imshow(R_3/255);title('8×8大小子块变换的结果');