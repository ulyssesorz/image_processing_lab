%转换得到图像的HSI分量，分别进行显示
%对R通道数据进行灰度分层处理，生成5种颜色伪彩图像，自定义分层准则和伪彩色，显示伪彩色图像

imag=imread('刘德华-长衫.jpg');
%RGB转HSI
hsi=rgb2hsi(imag);%直接调用函数
H=hsi(:,:,1);S=hsi(:,:,2);I=hsi(:,:,3);
figure;imshow(H);title('H分量');
figure;imshow(S);title('S分量');
figure;imshow(I);title('I分量');

%伪彩色图像
R=imag(:,:,1);
threshold=[30 70 94 108 134 174 189 200 228];%设置门限值
g2c=grayslice(R,threshold);%基于密度分层
mymap=[0 0 0
    1 0 0
    0 1 0
    1 1 1
    1 1 0
    0 0 1];%定义对应的5种颜色
figure;imshow(g2c,colormap(mymap));title('伪彩色图像');
