%Rͨ���Ҷ�ͼ����ж�ά����Ҷ�任����ʾ�任��Ƶ���׺���ǣ�������Ҫ������ǿ����λ��ʾ
%����Rͨ����Ƶ���׺�Gͨ��������ؽ��Ҷ�ͼ����ʾ

imag=imread('���»�-�޼��.jpg');
imag_g=imag;%����
imag(:,:,2)=0;
imag(:,:,3)=0;
imag=rgb2gray(imag);%תΪ�Ҷ�ͼ��
imag=im2double(imag);
figure;imshow(imag,[]);title('Rͨ���Ҷ�ͼ');

f=fft2(imag);%��ά����Ҷ�任
ft=fftshift(f);%���������ĸ���Ҷ�任
margin=log(abs(ft)+1);%�Է��Ƚ��ж����任��ǿ
phase=angle(ft);%��λ��
figure;imshow(margin,[]);title('������');
figure;imshow(phase,[]);title('��λ��');

imag_g(:,:,1)=0;
imag_g(:,:,3)=0;
imag_g=rgb2gray(imag_g);
imag_g=im2double(imag_g);
f2=fft2(imag_g);%��Gͨ�����б任
x=abs(f);%Rͨ������
y=angle(f2);%Gͨ����λ
i=x.*cos(y)+x.*sin(y).*i;
imag2=abs(ifft2(i));%���任
figure;imshow(imag2,[]);title('�ؽ����ͼ��');
