function [I_D_rep] = ButterworthHighPassFilter(imag,n)
    I_D=im2double(imag);
    %获得图像的高度和宽度
    [M,N]=size(I_D);
    %图像中心点
    M0=M/2;
    N0=N/2;
    J=fft2(I_D);
    J_shift=fftshift(J);
    D0=20;
    %截至频率距离圆点的距离
    for x=1:M
        for y=1:N
            %计算点（x,y）到中心点的距离
            d=sqrt((x-M0)^2+(y-N0)^2);
            %计算巴特沃斯滤波器
            h=1/(1+(D0/d)^(2*n));
            %用滤波器乘以主函数
            J_shift(x,y)=J_shift(x,y)*h;
        end
    end
    I_D_rep=ifft2(J_shift);
    end

