%对三个通道分别进行频域高斯低通滤波，参数自取，显示滤波后RGB彩色图像
%对三个通道分别进行频域巴特沃斯高通滤波，参数自取，显示滤波后RGB彩色图像

clear all
imag=imread('刘德华-天下无贼.jpg');
figure;imshow(imag);title('原图');

R=imag(:,:,1);R_gaussian=GaussianLowPassFilter(R,100);%输入图像和截止频率
G=imag(:,:,2);G_gaussian=GaussianLowPassFilter(G,100);
B=imag(:,:,3);B_gaussian=GaussianLowPassFilter(B,100);

RGB_gaussian=cat(3,R_gaussian,G_gaussian,B_gaussian);
RGB_gaussian(:,:,1)=R_gaussian; 
RGB_gaussian(:,:,2)=G_gaussian; 
RGB_gaussian(:,:,3)=B_gaussian; 
figure;imshow(RGB_gaussian);title('高斯低通滤波后的图像');

R=imag(:,:,1);R_butterworth=ButterworthHighPassFilter(R,2);%输入图像和阶数
G=imag(:,:,2);G_butterworth=ButterworthHighPassFilter(G,2);
B=imag(:,:,3);B_butterworth=ButterworthHighPassFilter(B,2);

RGB_butterworth=cat(3,R_butterworth,G_butterworth,B_butterworth);
RGB_butterworth(:,:,1)=R_butterworth; 
RGB_butterworth(:,:,2)=G_butterworth; 
RGB_butterworth(:,:,3)=B_butterworth; 
figure;imshow(RGB_butterworth);title('巴特沃斯高通滤波后的图像');