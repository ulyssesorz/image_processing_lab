%1����ȡʵ�����ݰ����桰03-���»�.jpg����
%��ȡ���������������ձ����������滻�ɡ�03-�󺣱���.jpg��

imag=imread('���»�_������.jpg');
imag2=imread('�󺣱���.jpg');

R=imag(:,:,1);%rgb��ͨ��
G=imag(:,:,2);
B=imag(:,:,3);
%�ı䱳����rgb��Χ
R(R<57)=0;
G(G<96)=0;
B(B<152)=0;
c=R&G&B;
se=strel('disk',5);%ֱ��Ϊ5�ĽṹԪ��
i2=imopen(c,se);%������
i3=[i2==0];
imag3=double(imag2).*i2+double(imag).*i3;%ͼ��ϳ�
imshow(mat2gray(imag3));
title('���»�-��ͼ��');