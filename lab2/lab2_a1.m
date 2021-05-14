%读取实验数据包里面“04-刘德华.jpg”，完成：
%利用对数变换对图像进行增强处理，突出背景，显示处理后图像
%利用幂律变换对图像进行增强处理，突出背景，显示处理后图像

imag=imread('刘德华-建国大业剧照.jpg');
imshow(imag);
title('原图');
imag2=mat2gray(log(1+double(imag)));%转为double类型后代入对数函数
figure;
imshow(imag2)
title('对数变换的图像');
imag3=mat2gray(double(imag).^0.25);
figure;
imshow(imag3);
title('幂变换的图像');
