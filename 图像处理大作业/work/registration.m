clear all;
close all;
fid = fopen("result.txt","w");   
for i = 1:96
	imag1 = im2double(imread(['C:\Users\magic\OneDrive\����\ͼ�������ҵ\ͼ����׼����ҵ\RefImg\RefImg_',num2str(i),'.bmp']));%�����Ӧ�Ĳο�ͼ��ʵʱͼ
    imag2 = im2double(imread(['C:\Users\magic\OneDrive\����\ͼ�������ҵ\ͼ����׼����ҵ\RealImg\RealImg_',num2str(i),'.bmp']));

    [r1, c1] = size(imag1);%ͼ��ĳߴ�
    [r2, c2] = size(imag2);
    
    i1 = edge(imag1, 'log');%��Ե����
    i2 = edge(imag2, 'log');
    
    result=zeros(r1-r2+1,c1-c2+1);
    i2_2=-0.1*(i2==0)+i2;
   
    %����Ҷ�任�õ���λ����
    FFT1 = fft2(i1); % ��άFFT
    FFT2 = conj(fft2(i2_2,r1,c1)); %�����
    
    %�󸴹�����
    FFTR = FFT1.*FFT2; 
    %�������׵ķ��任
    temp = real(ifft2(FFTR));
    result(1:r1-r2+1 , 1:c1-c2+1) = temp(1:r1-r2+1 , 1:c1-c2+1);
    
    M = max(max(result));%�ҵ�ƽ�Ƶķ�ֵ�������ƽ����
    [m,n] = find(result == M);
    imag1(m:m+r2-1, n:n+c2-1) = imag2;%��ʵͼ�ڲο�ͼ�ϵ�λ��
    %figure;imshow(imag1, []);
    fprintf(fid,'%3d  %3d\r\n',n,m);
end
fclose(fid);