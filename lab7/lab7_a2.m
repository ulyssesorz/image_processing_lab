%读取实验数据包里面“20-刘德华.jpg”，从RGB通道中选择一个合适的通道，
%利用阈值分割法（阈值不能手动设定）对图像进行分割，要求分割结果基本能区分人物和背景，显示分割结果。

imag=imread('20-刘德华.jpg');
figure;imshow(imag);title('原图');
R=imag(:,:,1);
figure;imshow(R);title('R通道');
R=im2double(R);
level1=graythresh(R);%全局阈值
level2=R(1,1)*4/5;%背景的阈值
R_2=double((R>level1)|(R<level2));
figure;imshow(R_2,[]);title('分割后的图像');