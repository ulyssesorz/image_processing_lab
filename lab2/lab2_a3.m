%��ȡʵ�����ݰ���06-���»�.jpg������ɣ�
%��ͼ���Rͨ�����ݽ��пռ�ƽ���˲����˲������˲�������ѡ������ʾ�˲����
%����������˹���˲���������ƽ���˲���������񻯣���ʾ�񻯽��

%��ֵ�˲�
imag=imread('���»�-�޼��.jpg');
[r,l]=size(imag);
l=l/3;
imag=imag(:,:,3);%Rͨ��
figure;
imshow(imag);
title('ԭͼ')
imag2=imag;
for i=1:r
    for j=1:l
        up=max(i-1,1);
        down=min(i+1,r);
        left=max(j-1,1);
        right=min(j+1,l);
        imag2(i,j)=mean(mean(imag(up:down,left:right)));
    end
end
figure;
imshow(imag2,[]);
title('��ֵ�˲���Ľ��')
% mo=ones(10);
% imag2=imfilter(imag,mo,'replicate');

%������˹�˲�
imag2=im2double(imag2);
mo2=fspecial('laplacian');%������˹ģ��
g=imfilter(imag2,mo2,'replicate');%�˲�
figure;
imshow(g,[]);
title('�궨���ͼ��')
imag3=imag2-g;
figure;
imshow(imag3,[]);
title('������˹�˲����ͼ��');
        
