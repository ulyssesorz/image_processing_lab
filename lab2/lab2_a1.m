%��ȡʵ�����ݰ����桰04-���»�.jpg������ɣ�
%���ö����任��ͼ�������ǿ����ͻ����������ʾ�����ͼ��
%�������ɱ任��ͼ�������ǿ����ͻ����������ʾ�����ͼ��

imag=imread('���»�-������ҵ����.jpg');
imshow(imag);
title('ԭͼ');
imag2=mat2gray(log(1+double(imag)));%תΪdouble���ͺ�����������
figure;
imshow(imag2)
title('�����任��ͼ��');
imag3=mat2gray(double(imag).^0.25);
figure;
imshow(imag3);
title('�ݱ任��ͼ��');
