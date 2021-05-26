%对R通道添加均值为0，标准差为20的高斯噪声
%对G通道添加10和240值的椒盐噪声，椒、盐概率均为0.05
%对B通道添加均值为10的指数噪声
%显示三种噪声直方图、添加噪声后三个通道图像

%高斯白噪声
imag=imread('刘德华-赌侠.jpg');
R=imag(:,:,1);
R=double(R);
noise1=20*randn(size(R));%randn产生正态分布的随机数模拟高斯噪声
R_2=R+noise1;
figure;histogram(noise1);title('高斯白噪声直方图');
figure;imshow(R_2,[]);title('添加高斯白噪声的R通道');

%椒盐噪声
G=imag(:,:,2);
G=double(G);
k=0.05;%设置概率
%rand产生0-1的随机数，所以小于k即概率为k
a1=rand(size(G))<k;%椒
a2=rand(size(G))<k;%盐
noise2=(a1==1)*10+(a2==1)*240;%分配数值
G_2=G+noise2;
figure;histogram(noise2);title('椒盐噪声直方图');
figure;imshow(G_2,[]);title('添加椒盐噪声的B通道');

%指数噪声
B=imag(:,:,3);
B=double(B);
noise3=exprnd(10,size(G));%产生指数类型的噪声
B_2=B+noise3;
figure;histogram(noise3);title('指数噪声直方图');
figure;imshow(B_2,[]);title('添加指数噪声的B通道');

