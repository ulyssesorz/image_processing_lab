%1���ֱ���ʾRGB��ͨ��
%2�����Rͨ�����ֵ��Gͨ����Сֵ��Bͨ����ֵ
%3������01-���»�.jpg����ȡ����358��441�����֤�գ����ش�С��
%����ʾ�ʹ洢��jpg��ʽ��������3����ͼ��

imag=imread('���»�_֤����.jpg');
channel1=imag;
channel2=imag;
channel3=imag;

%����ͨ��
channel1(:,:,2)=0;
channel1(:,:,3)=0;
channel2(:,:,1)=0;
channel2(:,:,3)=0;
channel3(:,:,1)=0;
channel3(:,:,2)=0;

%��ͼ
subplot(1,3,1);
imshow(channel1);
title('Rͨ��ͼ��');
subplot(1,3,2);
imshow(channel2);
title('Gͨ��ͼ��');
subplot(1,3,3);
imshow(channel3);
title('Bͨ��ͼ��');

%R�����ֵ
R_max=max(max(channel1))
%G����Сֵ
G_min=min(min(channel2))

%B�ľ�ֵ
[r,l]=size(channel3);
channel3=double(channel3);
sum=0;
for i=1:r
    for j=1:l
        sum=sum+channel3(i,j);
    end
end
B_mean=sum/(r*l)

%�ز���
imag2=imresize(imag,[441,358]);
figure;
imshow(imag2);
title('358*441ͼ��');
size(imag2)

%������
imag3=fix(imag/32)*32;
% imwrite(imag3,'�������ͼ��.jpg','jepg');
figure;
imshow(imag3)
title('�������ͼ��');

