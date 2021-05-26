function [r,R,S]=imnoise3(M,N,C,A,B)
%产生一个大小为M*N的正弦噪声模型r,R为傅里叶变换，S为正弦噪声模型的傅里叶的频谱
%C为冲击位置的坐标，A是1*k维向量包含振幅的冲击对，B是由k*2矩阵组成的冲击对

%处理输入参数
[K,n]=size(C);%矩阵C的行数返回给K，矩阵C的列数返回给n
if nargin==3
    A(1:K)=1.0;
    B(1:K,1:2)=0;
elseif nargin==4
    B(1:K,1:2)=0;
end
R=zeros(M,N);%构造R
for j=1:K%j从1到K取遍，步长为1
    u1=M/2+1+C(j,1);v1=N/2+1+C(j,2);
    R(u1,v1)=i*(A(j)/2)*exp(i*2*pi*C(j,1)*B(j,1)/M);
    %复共轭
    u2=M/2+1-C(j,1);v2=N/2+1-C(j,2);
    R(u2,v2)=-i*(A(j)/2)*exp(i*2*pi*C(j,2)*B(j,2)/N);
end
S=abs(R);%计算光谱
r=real(ifft2(ifftshift(R)));%产生空间正弦图形