%�������ѹ�������������ӣ��ֱ���������ͼ��ɫ�Ⱥ����ȵı���ȣ����������������壬�����г���ʵ��
%��ͼ��24-���»�0.jpg��Ϊԭͼ��������Ƶ����Ӷ�����ѹ��ͼ��1/2/3�����������򣬸�����������������

imag0 = imread('24-���»�0.jpg');
imag1 = imread('24-���»�1.jpg');
imag2 = imread('24-���»�2.jpg');
imag3 = imread('24-���»�3.jpg');
[m, n, c] = size(imag0);
I0_hsi = rgb2hsv(imag0);%תhsv�������ж�ɫ�Ⱥ�����
I1_hsi = rgb2hsv(imag1);
I2_hsi = rgb2hsv(imag2);
I3_hsi = rgb2hsv(imag3);
%������������
D=zeros(1,3);                    
scale =size(I0_hsi(1,:,:));
scale = scale(1)*scale(2)*scale(3); 
HSI = cat(4,I1_hsi(3,:,:),I2_hsi(3,:,:),I3_hsi(3,:,:));
I = cat(4,imag1,imag2,imag3);
for i= 1:3
    D(i) = sum(sum(sum((I0_hsi-HSI (:,:,:,i)).^2)))/scale;   
end
fprintf('\n')
disp('ͼ1��ͼ2��ͼ3������������������Ϊ��ԽСԽ�ã�:')
disp(D)
fprintf('�����ȱ����Ϊ��׼��ͼ��1��2��3�����������Ӻõ�������Ϊ��1��2��3\n')

%ɫ����������
D1 = zeros(1,3);  % ��ʼ�����ȱ������������
HSI = cat(4,I1_hsi(1,:,:).*I1_hsi(2,:,:),I2_hsi(1,:,:).*I2_hsi(2,:,:),I3_hsi(1,:,:).*I3_hsi(1,:,:));
HSI0_HS = I0_hsi(1,:,:).*I0_hsi(2,:,:);

for j = 1:3
    % ɫ�ȱ�����������ӣ�ѹ����I������ԭͼ��I����ľ�����
    D1(j) = sum(sum(sum((HSI0_HS-HSI(:,:,:,j)).^2)))/scale;  
end

fprintf('\n')
disp('ͼ1��ͼ2��ͼ3��ɫ��������������Ϊ��ԽСԽ�ã�:')
disp(D1)
fprintf('��ɫ�ȱ����Ϊ��׼��ͼ��1��2��3�����������Ӻõ�������Ϊ��1��2��3\n')