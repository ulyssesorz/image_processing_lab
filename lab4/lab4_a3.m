%�ж�Rͨ���������࣬���ѡ����ʵĿռ��˲�������Rͨ��ͼ��ԭ������ʾ��ԭ���
%�ж�Gͨ���������࣬���ѡ����ʵ�Ƶ���˲�������Gͨ��ͼ��ԭ������ʾ��ԭ���

%Rͨ��Ϊ��������������ֵ�˲���
imag=imread('���»�-���ڽ���.tif');
R=imag(:,:,1);%ȡRͨ��
figure;imshow(R);title('Rͨ��ԭͼ');
R_2=medfilt2(R,[3,3]);%��ֵ�˲�
figure;imshow(R_2);title('��ֵ�˲����ͼ��');

%Gͨ��Ϊ��Ƶ����������ʹ�ô����˲���
G=imag(:,:,2);
figure;imshow(G),title('Gͨ��ԭͼ');
F=fftshift(fft2(G));%ת����Ƶ����
figure,imshow(log(abs(F)+1),[]),title('Ƶ��ͼ��');
[m,n]=size(F);
u=0:m-1;v=0:n-1;
[V,U]=meshgrid(v,u);
D0=100;%��ֹ�뾶
n=5;%����
v0=115;v1=575;%������λ��
D1=abs(V-v0);
D2=abs(V-v1);
H=1./(1+(D0^2./(D1.*D2)).^n);%���������˲���
G=F.*H;%����ͼ��
figure;imshow(log(abs(G)+1),[]),title('�˲����Ƶ��ͼ��');
G_2=real(ifft2(ifftshift(G)));%��任
figure;imshow(G_2,[]),title('�����˲����ͼ��');
 
