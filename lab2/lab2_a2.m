%��ȡʵ�����ݰ� ��05-���»�.tif������ɣ�
%����ȫ��ֱ��ͼ���⻯��ǿ����ʾ������ܷ񹻿�����װƷ��logo
%���þֲ�ֱ��ͼ���⻯��ǿ����ʾ������ܷ񹻿�����װƷ��logo

%ȫ�־��⻯
imag=imread('���»�-��װƷ��.tif');
figure;
imshow(imag);
title('ԭͼ');
figure
imhist(imag);%imhist���ƻҶ�ֱ��ͼ
title('ԭͼ��Ҷ�ֱ��ͼ');
figure;
imshow(histeq(imag));%histeq���о��⻯
title('���⻯���ͼ��');
figure;
imhist(histeq(imag));
title('���⻯���ֱ��ͼ');

%�ֲ����⻯
[a,b,c]=size(imag);
imag2=imag;
for i=500:a-25
    for j=450:b-195 
        for k=1:3
            temp=imag2(i-24:i+24,j-24:j+24,k);
            h=imhist(temp)./numel(temp);
            c=cumsum(h);
            imag2(i,j,k)=c(temp(25,25)+1)*255;
        end
    end
end
figure;
imshow(imag2);
title('�ֲ����⻯���ͼ��');

