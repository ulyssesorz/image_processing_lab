%1����ȡʵ�����ݰ����桰02-���»�.jpg������ɶԸ�ͼ��Ķ�ֵ����0��255������
%Ҫ���ֵ����0��255ֵ���ص���ĿԼ��ռһ�롣�����ֵ������ֵ������ʾ��ֵ��ͼ��

imag=imread('���»�_�ݳ���.jpg');

imag2=imag(:);%�������Ա�����ֵ
mid=median(imag2);%��ֵ�����Ҷ�����
imag(imag<mid)=0;%�����޻��ֶ�ֵ
imag(imag>mid)=255;
imshow(imag);
title('��ֵͼ');
length(find(imag==0))
length(find(imag==255))