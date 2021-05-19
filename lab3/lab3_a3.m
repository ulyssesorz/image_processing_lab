%根据RGB三通道的频率谱特性设计一个自适应谱加权滤波器，显示移位后滤波器
%利用该滤波器对三个通道分别进行频域滤波，显示滤波后RGB合成图像

imag=imread('刘德华-投名状.jpg');
figure;imshow(imag);title('原图');
imag2=rgb2gray(imag);
f=fft2(imag2);%二维傅里叶变换
ft=fftshift(f);%经过调整的傅里叶变换
margin=log(abs(ft)+1);%对幅度进行对数变换增强
figure;imshow(margin,[]);title('幅度谱');

%移位后的滤波器
im_fft = fft2(imag);
sum1 = sum(sum(sum(abs(im_fft).^2)));%计算频谱能量
sig = 20;%误差
[m, n, o] = size(imag);
Sum = sum1;
while(Sum > sum1*0.95)%保留原频谱95%能量
    sig = sig - 0.5; %调整高斯滤波器方差
    Hg = lpfilter('gaussian',m,n, sig); %高斯低通滤波器
    G = Hg.*im_fft; %频域滤波
    Sum = sum(sum(sum(abs(G).^2))); %重新计算新频谱能量
    if(sig == 1)%判断误差是否达到要求
        break
    end
end
figure;imshow(log(1+abs(fftshift(Hg))),[]);title('自适应高斯低通滤波器');

%滤波后合成图像
G_real = real(ifft2(G));
figure;imshow(G_real/255); title('滤波后的RGB图像');