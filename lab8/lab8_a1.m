%��д����ʵ�ֶ�Rͨ���Ҷȵ�����������������ʾ����������ֱ��ͼ
%�����������������ȳ���������ı�����

imag=imread('22-���»�.tif');
% figure;imshow(imag);title('ԭͼ');
R=imag(:,:,1);
figure;histogram(R,256);title('Rͨ���ĻҶ�ֱֵ��ͼ');
count=unique(R); %R�Ҷȵĸ���
for i = 1:8 
    if (max(mod(count, 2^i)) ~= 0)%��������λ��
        break;
    end
end
num=2^(i-1);
R=R/num;%��Rͨ����������
figure;histogram(R,256);title('������R��ֱ��ͼ');
n=log2(256)-log2(num)