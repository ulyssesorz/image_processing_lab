%判断R通道噪声种类，设计选择合适的空间滤波器进行R通道图像复原，并显示复原结果
%判断G通道噪声种类，设计选择合适的频域滤波器进行G通道图像复原，并显示复原结果

%R通道为椒盐噪声，用中值滤波器
imag=imread('刘德华-龙在江湖.tif');
R=imag(:,:,1);%取R通道
figure;imshow(R);title('R通道原图');
R_2=medfilt2(R,[3,3]);%中值滤波
figure;imshow(R_2);title('中值滤波后的图像');

%G通道为单频周期噪声，使用带阻滤波器
G=imag(:,:,2);
figure;imshow(G),title('G通道原图');
F=fftshift(fft2(G));%转化到频域处理
figure,imshow(log(abs(F)+1),[]),title('频域图像');
[m,n]=size(F);
u=0:m-1;v=0:n-1;
[V,U]=meshgrid(v,u);
D0=100;%截止半径
n=5;%阶数
v0=115;v1=575;%噪声的位置
D1=abs(V-v0);
D2=abs(V-v1);
H=1./(1+(D0^2./(D1.*D2)).^n);%构建带阻滤波器
G=F.*H;%输入图像
figure;imshow(log(abs(G)+1),[]),title('滤波后的频域图像');
G_2=real(ifft2(ifftshift(G)));%逆变换
figure;imshow(G_2,[]),title('带阻滤波后的图像');
 
