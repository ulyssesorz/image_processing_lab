%������ͨ���ֱ����Ƶ���˹��ͨ�˲���������ȡ����ʾ�˲���RGB��ɫͼ��
%������ͨ���ֱ����Ƶ�������˹��ͨ�˲���������ȡ����ʾ�˲���RGB��ɫͼ��

clear all
imag=imread('���»�-��������.jpg');
figure;imshow(imag);title('ԭͼ');

R=imag(:,:,1);R_gaussian=GaussianLowPassFilter(R,100);%����ͼ��ͽ�ֹƵ��
G=imag(:,:,2);G_gaussian=GaussianLowPassFilter(G,100);
B=imag(:,:,3);B_gaussian=GaussianLowPassFilter(B,100);

RGB_gaussian=cat(3,R_gaussian,G_gaussian,B_gaussian);
RGB_gaussian(:,:,1)=R_gaussian; 
RGB_gaussian(:,:,2)=G_gaussian; 
RGB_gaussian(:,:,3)=B_gaussian; 
figure;imshow(RGB_gaussian);title('��˹��ͨ�˲����ͼ��');

R=imag(:,:,1);R_butterworth=ButterworthHighPassFilter(R,2);%����ͼ��ͽ���
G=imag(:,:,2);G_butterworth=ButterworthHighPassFilter(G,2);
B=imag(:,:,3);B_butterworth=ButterworthHighPassFilter(B,2);

RGB_butterworth=cat(3,R_butterworth,G_butterworth,B_butterworth);
RGB_butterworth(:,:,1)=R_butterworth; 
RGB_butterworth(:,:,2)=G_butterworth; 
RGB_butterworth(:,:,3)=B_butterworth; 
figure;imshow(RGB_butterworth);title('������˹��ͨ�˲����ͼ��');