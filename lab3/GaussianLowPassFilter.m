function [g] =GaussianLowPassFilter (image_input , D0)
    %GULS ��˹��ͨ�˲���,D0Ϊ����Ƶ�ʵģ��൱�������ڸ���Ҷ��ͼ�İ뾶ֵ��
    %�ж�ͼ���Ƿ�Ϊ�Ҷ�ͼ�����ǻҶ�ͼ�Ļ�����ͼ���Ϊ�Ҷ�ͼ
    f = image_input;
    f = mat2gray(f,[0 255]);
    % 1.����һ����СΪM*N������ͼ��f(x,y),�õ�������P = 2M,Q = 2N
    [m,n] = size(f);
    P = 2 * m;
    Q = 2 * n; 
    % 2.��f(x,y)��ӱ�Ҫ������0���γɴ�СΪP * Q�������ͼ��fp(x,y)
    fp = zeros(P,Q);
    fp(1:m,1:n) = f(1:m,1:n);
    % 3.��(-1)^(x+y)����fp(x,y)�Ƶ��佻��������
    for i = 1 : m
        for j = 1 : n 
            fp(i,j) = double(fp(i,j)*(-1)^(i+j));
        end
    end
    % 4.�������Բ���3��ͼ���DFT���õ�F(u,v)
    F = fft2(fp,P,Q);
    % 5.����һ��ʵ�ġ��ԳƵ��˲�����H(u,v),���СΪP*Q�������ڣ�P/2,Q/2������
    % ����������γɳ˻�G(u,v) = H(u,v)F(u,v);��G(i,k)=H(i,k)F(i,k)
    H = zeros(P,Q);
    a = 2 * D0^2;
    for u = 1 :P
        for v = 1:Q
            D = (u-(m+1.0))^2+(v-(n+1.0))^2;
            H(u,v) = exp((-D)/a);
        end
    end
    G = H.*F;
    % 6.�õ�������ͼ��
    gp = ifft2(G); 
    gp = real(gp);
    for i = 1 : m
        for j = 1 : n 
            gp(i,j) = double(gp(i,j)*(-1)^(i+j));
        end
    end
    % 7.ͨ����gp(x,y)������������ȡM*N���򣬵õ����մ�����g(x,y)
    g(1:m,1:n) = gp(1:m,1:n);
end