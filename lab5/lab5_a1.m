%ת���õ�ͼ���HSI�������ֱ������ʾ
%��Rͨ�����ݽ��лҶȷֲ㴦������5����ɫα��ͼ���Զ���ֲ�׼���α��ɫ����ʾα��ɫͼ��

imag=imread('���»�-����.jpg');
%RGBתHSI
hsi=rgb2hsi(imag);%ֱ�ӵ��ú���
H=hsi(:,:,1);S=hsi(:,:,2);I=hsi(:,:,3);
figure;imshow(H);title('H����');
figure;imshow(S);title('S����');
figure;imshow(I);title('I����');

%α��ɫͼ��
R=imag(:,:,1);
threshold=[30 70 94 108 134 174 189 200 228];%��������ֵ
g2c=grayslice(R,threshold);%�����ܶȷֲ�
mymap=[0 0 0
    1 0 0
    0 1 0
    1 1 1
    1 1 0
    0 0 1];%�����Ӧ��5����ɫ
figure;imshow(g2c,colormap(mymap));title('α��ɫͼ��');
