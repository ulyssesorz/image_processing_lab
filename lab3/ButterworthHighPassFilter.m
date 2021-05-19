function [I_D_rep] = ButterworthHighPassFilter(imag,n)
    I_D=im2double(imag);
    %���ͼ��ĸ߶ȺͿ��
    [M,N]=size(I_D);
    %ͼ�����ĵ�
    M0=M/2;
    N0=N/2;
    J=fft2(I_D);
    J_shift=fftshift(J);
    D0=20;
    %����Ƶ�ʾ���Բ��ľ���
    for x=1:M
        for y=1:N
            %����㣨x,y�������ĵ�ľ���
            d=sqrt((x-M0)^2+(y-N0)^2);
            %���������˹�˲���
            h=1/(1+(D0/d)^(2*n));
            %���˲�������������
            J_shift(x,y)=J_shift(x,y)*h;
        end
    end
    I_D_rep=ifft2(J_shift);
    end

