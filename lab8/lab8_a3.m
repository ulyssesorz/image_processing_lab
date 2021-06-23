%设计两种压缩质量评价因子，分别用于评价图像色度和亮度的保真度，简单描述因子物理含义，并进行程序实现
%以图像“24-刘德华0.jpg”为原图，利用设计的因子对三幅压缩图像1/2/3进行质量排序，给出两种因子排序结果

imag0 = imread('24-刘德华0.jpg');
imag1 = imread('24-刘德华1.jpg');
imag2 = imread('24-刘德华2.jpg');
imag3 = imread('24-刘德华3.jpg');
[m, n, c] = size(imag0);
I0_hsi = rgb2hsv(imag0);%转hsv更容易判断色度和亮度
I1_hsi = rgb2hsv(imag1);
I2_hsi = rgb2hsv(imag2);
I3_hsi = rgb2hsv(imag3);
%亮度质量排序
D=zeros(1,3);                    
scale =size(I0_hsi(1,:,:));
scale = scale(1)*scale(2)*scale(3); 
HSI = cat(4,I1_hsi(3,:,:),I2_hsi(3,:,:),I3_hsi(3,:,:));
I = cat(4,imag1,imag2,imag3);
for i= 1:3
    D(i) = sum(sum(sum((I0_hsi-HSI (:,:,:,i)).^2)))/scale;   
end
fprintf('\n')
disp('图1、图2、图3的亮度评价因子依次为（越小越好）:')
disp(D)
fprintf('以亮度保真度为标准，图像1、2、3的排序质量从好到坏依次为：1、2、3\n')

%色度质量排序
D1 = zeros(1,3);  % 初始化亮度保真度评价因子
HSI = cat(4,I1_hsi(1,:,:).*I1_hsi(2,:,:),I2_hsi(1,:,:).*I2_hsi(2,:,:),I3_hsi(1,:,:).*I3_hsi(1,:,:));
HSI0_HS = I0_hsi(1,:,:).*I0_hsi(2,:,:);

for j = 1:3
    % 色度保真度评价因子：压缩后I矩阵与原图像I矩阵的均方根
    D1(j) = sum(sum(sum((HSI0_HS-HSI(:,:,:,j)).^2)))/scale;  
end

fprintf('\n')
disp('图1、图2、图3的色度评价因子依次为（越小越好）:')
disp(D1)
fprintf('以色度保真度为标准，图像1、2、3的排序质量从好到坏依次为：1、2、3\n')