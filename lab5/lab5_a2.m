%��ͼ����в�ɫ�ֲ���������������沿����ɫ�ʲ��䣬���������ûң�������ʾ
%��ͼ����в�ɫֱ��ͼ���⻯������ʾ���⻯ǰ����ͼ��

imag=imread('���»�-ë��.jpg');
%ͼ��ֲ�
R=double(imag(:,:,1));
G=double(imag(:,:,2));
B=double(imag(:,:,3));
[m,n]=size(R);
face=imag(260:300,490:650,:);%ѡ���沿����
rmin=min(min(face(:,:,1)));rmax=max(max(face(:,:,1)));%�����������rgb��Χ
gmin=min(min(face(:,:,2)));gmax=max(max(face(:,:,2)));
bmin=min(min(face(:,:,3)));bmax=max(max(face(:,:,3)));
a=R>rmin&R<rmax;b=G>gmin&G<gmax;c=B>bmin&B<bmax;
k=logical(-double(a&b&c)+1);%��ͼ����Ҫ����ɫ��1��������0
R(k)=205;G(k)=205;B(k)=205;%������������Ϊ��ɫ
imag2=imag;
imag2(:,:,1)=R;imag2(:,:,2)=G;imag2(:,:,3)=B;%�ϳ���ͼ��
imshow(imag2),title('�ָ���ͼ��');

%���⻯
hsi=rgb2hsi(imag);%ת��Ϊhsi
i=hsi(:,:,3);
i2=histeq(i,256);%��I�������о��⻯
hsi(:,:,3)=i2;
rgb=hsi2rgb(hsi);
figure;imshow(rgb);title('���⻯���ͼ��');