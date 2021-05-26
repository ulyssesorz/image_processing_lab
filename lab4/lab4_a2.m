%对R通道添加单一频点周期噪声，参数自取，显示添加噪声后R通道图像（要能明显看出噪声）
%对G通道添加两个单频周期噪声，噪声频点分布在频率谱的两个坐标轴上，
%频率为最高频1/2，幅度为频率谱峰值1/2，显示噪声谱及添加噪声后G通道图像

imag=imread("刘德华-长城.jpg");
R=double(imag(:,:,1));
[m,n]=size(R);
%R通道添加单一频点周期噪声
F=fft2(R);%傅里叶变换
Max_F1= max(max(F));%幅度峰值
[r, R1, S] = imnoise3(m, n, [25,-25], Max_F1);%产生正弦噪声，方向由[25,-25]控制
R =R+r;%新的R通道
figure;imshow(R,[]);title("添加噪声的R通道");

%G通道添加两个单频周期噪声
G = double(imag(:,:,2));
F1= fft2(G);
Max_F2=max(max(F1));
[r1, R11, S1] = imnoise3(m, n, [m/4,0], Max_F2/2);
[r2, R22, S2] = imnoise3(m, n, [0,n/4], Max_F2/2);%添加两个单频周期噪声
figure;[x,y] = meshgrid([-256:255]);
plot3(x,y,real(S1+S2));title("噪声谱");
figure;imshow(G+r1+r2,[]);title("添加噪声的G通道");