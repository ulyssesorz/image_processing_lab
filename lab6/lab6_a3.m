%����һ��ʵ�飨ʵ��ʮ�ߣ��������Ļ����ϣ���ɣ�
%�������ͨ�����ڲ��׶����������䣬����ʾ�����
%��ȡ��������ͼ��ı߽粢��ʾ

imag=imread('17-���»�.jpg');
figure;imshow(imag);title('ԭͼ');
%��ֵ��
G=imag(:,:,2);%ѡ��Gͨ��
thresh=234;%�ֶ��������ޣ���ԼΪ��ɫ�ĻҶ�ֵ
G_2=im2bw(G,thresh/255);%��ֵ��
a=G_2<0.5;b=G_2>0.5;%�õ�0,1������
G_2(a)=1;G_2(b)=0;%���ڰ׵�ת
figure;imshow(G_2);title('��ֵ�����ͼ��');

%��ͨ������ȡ
cc=bwconncomp(G_2)%��ͨ������Ŀ
L=bwlabel(G_2,4);%Ϊ��ͨ�������
count=tabulate(L(:));%���ִ���
num=count(2:end,2); %������ͨ������1���ֵĴ���
index=find(num==max(num));%���������ֵ�λ��
M=(L==index);%��������ͨ����
figure;imshow(M);title('�����ͨ����');

%�׶����ͱ߽���ȡ
f1=imfill(M,'holes');%���׶�
se=ones(3);%3*3ģ��
f2=imdilate(f1,se,'same');%���Ͳ���
M_2=bwperim(f2);%��ȡ�߽�
figure;imshow(f1);title('����ͼ');
figure;imshow(M_2);title('ͼ��߽�');





