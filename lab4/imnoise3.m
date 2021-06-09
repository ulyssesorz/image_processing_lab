function [r,R,S]=imnoise3(M,N,C,A,B)
%����һ����СΪM*N����������ģ��r,RΪ����Ҷ�任��SΪ��������ģ�͵ĸ���Ҷ��Ƶ��
%CΪ���λ�õ����꣬A��1*kά������������ĳ���ԣ�B����k*2������ɵĳ����

%�����������
[K,n]=size(C);%����C���������ظ�K������C���������ظ�n
if nargin==3
    A(1:K)=1.0;
    B(1:K,1:2)=0;
elseif nargin==4
    B(1:K,1:2)=0;
end
R=zeros(M,N);%����R
for j=1:K%j��1��Kȡ�飬����Ϊ1
    u1=M/2+1+C(j,1);v1=N/2+1+C(j,2);
    R(u1,v1)=i*(A(j)/2)*exp(i*2*pi*C(j,1)*B(j,1)/M);
    %������
    u2=M/2+1-C(j,1);v2=N/2+1-C(j,2);
    R(u2,v2)=-i*(A(j)/2)*exp(i*2*pi*C(j,2)*B(j,2)/N);
end
S=abs(R);%�������
r=real(ifft2(ifftshift(R)));%�����ռ�����ͼ��