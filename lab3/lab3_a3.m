%����RGB��ͨ����Ƶ�����������һ������Ӧ�׼�Ȩ�˲�������ʾ��λ���˲���
%���ø��˲���������ͨ���ֱ����Ƶ���˲�����ʾ�˲���RGB�ϳ�ͼ��

imag=imread('���»�-Ͷ��״.jpg');
figure;imshow(imag);title('ԭͼ');
imag2=rgb2gray(imag);
f=fft2(imag2);%��ά����Ҷ�任
ft=fftshift(f);%���������ĸ���Ҷ�任
margin=log(abs(ft)+1);%�Է��Ƚ��ж����任��ǿ
figure;imshow(margin,[]);title('������');

%��λ����˲���
im_fft = fft2(imag);
sum1 = sum(sum(sum(abs(im_fft).^2)));%����Ƶ������
sig = 20;%���
[m, n, o] = size(imag);
Sum = sum1;
while(Sum > sum1*0.95)%����ԭƵ��95%����
    sig = sig - 0.5; %������˹�˲�������
    Hg = lpfilter('gaussian',m,n, sig); %��˹��ͨ�˲���
    G = Hg.*im_fft; %Ƶ���˲�
    Sum = sum(sum(sum(abs(G).^2))); %���¼�����Ƶ������
    if(sig == 1)%�ж�����Ƿ�ﵽҪ��
        break
    end
end
figure;imshow(log(1+abs(fftshift(Hg))),[]);title('����Ӧ��˹��ͨ�˲���');

%�˲���ϳ�ͼ��
G_real = real(ifft2(G));
figure;imshow(G_real/255); title('�˲����RGBͼ��');