%读取实验数据包里面“19-刘德华.jpg”，从RGB通道中选择一个合适的通道，
%利用边缘检测方法对图像进行分割，显示分割结果。

imag=imread('19-刘德华.jpg');
figure;imshow(imag);title('原图');
R=imag(:,:,1);
figure;imshow(R);title('R通道');
bw=edge(R,'canny');%edge函数，选择canny方法
figure;imshow(bw);title('分割结果');