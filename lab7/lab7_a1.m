%��ȡʵ�����ݰ����桰19-���»�.jpg������RGBͨ����ѡ��һ�����ʵ�ͨ����
%���ñ�Ե��ⷽ����ͼ����зָ��ʾ�ָ�����

imag=imread('19-���»�.jpg');
figure;imshow(imag);title('ԭͼ');
R=imag(:,:,1);
figure;imshow(R);title('Rͨ��');
bw=edge(R,'canny');%edge������ѡ��canny����
figure;imshow(bw);title('�ָ���');