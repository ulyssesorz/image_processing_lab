%��Rͨ����Ӿ�ֵΪ0����׼��Ϊ20�ĸ�˹����
%��Gͨ�����10��240ֵ�Ľ��������������θ��ʾ�Ϊ0.05
%��Bͨ����Ӿ�ֵΪ10��ָ������
%��ʾ��������ֱ��ͼ���������������ͨ��ͼ��

%��˹������
imag=imread('���»�-����.jpg');
R=imag(:,:,1);
R=double(R);
noise1=20*randn(size(R));%randn������̬�ֲ��������ģ���˹����
R_2=R+noise1;
figure;histogram(noise1);title('��˹������ֱ��ͼ');
figure;imshow(R_2,[]);title('��Ӹ�˹��������Rͨ��');

%��������
G=imag(:,:,2);
G=double(G);
k=0.05;%���ø���
%rand����0-1�������������С��k������Ϊk
a1=rand(size(G))<k;%��
a2=rand(size(G))<k;%��
noise2=(a1==1)*10+(a2==1)*240;%������ֵ
G_2=G+noise2;
figure;histogram(noise2);title('��������ֱ��ͼ');
figure;imshow(G_2,[]);title('��ӽ���������Bͨ��');

%ָ������
B=imag(:,:,3);
B=double(B);
noise3=exprnd(10,size(G));%����ָ�����͵�����
B_2=B+noise3;
figure;histogram(noise3);title('ָ������ֱ��ͼ');
figure;imshow(B_2,[]);title('���ָ��������Bͨ��');

