%��ͼ���������ƽ����ƽ��������ʾƽ��ǰ����ͼ��
%��ͼ�����������˹�񻯴�����ʾ��ǰ����ͼ��

imag=imread('���»�-����.jpg');
figure;imshow(imag);title('ԭͼ');
%��ֵ�˲�
h=fspecial('average',3);%��ֵ�˲�ģ��
imag2=imfilter(imag,h,'replicate');
figure;imshow(imag2);title('��ֵ�˲����ͼ��');

%������˹�˲�
h2=fspecial('laplacian',0.2);%������˹ģ��
i=imfilter(imag,h2,'replicate');
imag3=imag-i;
figure;imshow(imag3);title('������˹�˲����ͼ��');