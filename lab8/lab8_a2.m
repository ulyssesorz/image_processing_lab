%��Rͨ������DCT�任���������任��ֱ����������ʾ���任���
%��Rͨ������DCT�任�������任��64��64��ϵ������ʾ���任���
%��Rͨ������Ϊ����8��8��С�ӿ飬ÿ����DCT�任������ֱ����������ʾ���任����

imag=imread('23-���»�.jpg');
% figure;imshow(imag);title('ԭͼ');
R=double(imag(:,:,1));
dct_r=dct2(R);%��Rͨ��dct�任

%�������任��ֱ������
dct_1=zeros(size(dct_r));
dct_1(1)=dct_r(1);%����ֱ������
R_1=idct2(dct_1);
figure;imshow(R_1/255);title('������ֱ�������Ľ��');

%�����任��64��64��ϵ��
dct_2=zeros(size(dct_r));
dct_2(1:64,1:64)=dct_r(1:64,1:64);
R_2=idct2(dct_2);
figure;imshow(R_2/255);title('����64��64��ϵ���Ľ��');

%����Ϊ����8��8��С�ӿ飬ÿ����DCT�任������ֱ������
R_3=R;
dct_3=zeros(8,8);
for i = 1: 8: m-7
    for j = 1:8: n-7
        t = dct2(R(i:i+7, j:j+7));%ÿ���ӿ���dct�任
        dct_3(1,1) = t(1,1);%����ֱ��
        R_3(i:i+7, j:j+7) = idct2(dct_3);
    end
end 
figure;imshow(R_3/255);title('8��8��С�ӿ�任�Ľ��');