%��ȡʵ�����ݰ����桰20-���»�.jpg������RGBͨ����ѡ��һ�����ʵ�ͨ����
%������ֵ�ָ����ֵ�����ֶ��趨����ͼ����зָҪ��ָ�����������������ͱ�������ʾ�ָ�����

imag=imread('20-���»�.jpg');
figure;imshow(imag);title('ԭͼ');
R=imag(:,:,1);
figure;imshow(R);title('Rͨ��');
R=im2double(R);
level1=graythresh(R);%ȫ����ֵ
level2=R(1,1)*4/5;%��������ֵ
R_2=double((R>level1)|(R<level2));
figure;imshow(R_2,[]);title('�ָ���ͼ��');