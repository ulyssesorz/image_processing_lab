clear all;
close all;
fid = fopen("result.txt","w");   
for i = 1:96
	imag1 = im2double(imread(['C:\Users\magic\OneDrive\桌面\图像处理大作业\图像配准大作业\RefImg\RefImg_',num2str(i),'.bmp']));%读入对应的参考图和实时图
    imag2 = im2double(imread(['C:\Users\magic\OneDrive\桌面\图像处理大作业\图像配准大作业\RealImg\RealImg_',num2str(i),'.bmp']));

    [r1, c1] = size(imag1);%图像的尺寸
    [r2, c2] = size(imag2);
    
    i1 = edge(imag1, 'log');%边缘处理
    i2 = edge(imag2, 'log');
    
    result=zeros(r1-r2+1,c1-c2+1);
    i2_2=-0.1*(i2==0)+i2;
   
    %傅里叶变换得到相位特性
    FFT1 = fft2(i1); % 二维FFT
    FFT2 = conj(fft2(i2_2,r1,c1)); %共轭复数
    
    %求复功率谱
    FFTR = FFT1.*FFT2; 
    %复功率谱的反变换
    temp = real(ifft2(FFTR));
    result(1:r1-r2+1 , 1:c1-c2+1) = temp(1:r1-r2+1 , 1:c1-c2+1);
    
    M = max(max(result));%找到平移的峰值，即相对平移量
    [m,n] = find(result == M);
    imag1(m:m+r2-1, n:n+c2-1) = imag2;%真实图在参考图上的位置
    %figure;imshow(imag1, []);
    fprintf(fid,'%3d  %3d\r\n',n,m);
end
fclose(fid);