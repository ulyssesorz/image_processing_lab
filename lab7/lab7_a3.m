%��ȡʵ�����ݰ����桰21-���»�.jpg������RGBͨ����ѡ��һ�����ʵ�ͨ����
%���沿ѡȡ���ʵ���ʼ���������������������ָ����ͼ����зָ
%Ҫ��ָ�����������ȡ�沿����ʾ�ָ�����

imag=imread('21-���»�.jpg');
figure;imshow(imag);title('ԭͼ');
imag = imag(:,:,1);%ѡ����Rͨ��
figure;imshow(imag);title('Rͨ��');
imag=im2double(imag);
[M,N]=size(imag);
x=0.5;y=0.4;%���ɵ㣬�沿
x1=round(x*M);
y1=round(y*N);
seed=imag(x1,y1); %��ȡ�������ػҶ�ֵ
region=zeros(M,N);
region(x1,y1)=1;

count=1; %����������
threshold=0.14;
while count>0
    count=0;
    for i=1:M %��������ͼ��
    for j=1:N
        if region(i,j)==1 %���ڡ�ջ����
        if (i-1)>1&(i+1)<M&(j-1)>1&(j+1)<N %3*3������ͼ��Χ��
            for u=-1:1 %8-��������
            for v=-1:1
                if region(i+u,j+v)==0&abs(imag(i+u,j+v)-seed)<=threshold
                    region(i+u,j+v)=1;
                    count=count+1;  %��¼�˴��������ĵ����
                end
            end
            end
        end
        end
    end
    end
end
figure;imshow(region);title("�ָ���ͼ��");