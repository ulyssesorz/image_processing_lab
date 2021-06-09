%读取实验数据包里面“16-刘德华.jpg”，完成：
%手动选择合适的阈值对R通道进行二值化，要求二值化结果基本能区分人物和背景，人物赋予1，背景赋予0，显示二值化后图像
%利用膨胀、腐蚀或者开闭操作对上述二值化图像进行合理操作以便提取肖像边界，然后提取边界并显示

imag=imread('16-刘德华.jpg');
figure;imshow(imag);title('原图');
%二值化
R=imag(:,:,1);
thresh=252;%手动设置门限，大约为白色的灰度值
R_2=im2bw(R,thresh/255);%二值化
a=R_2<0.5;b=R_2>0.5;%得到0,1的索引
R_2(a)=1;R_2(b)=0;%将黑白倒转
figure;imshow(R_2);title('二值化后的图像');

%bwperim提取边界
f1=imfill(R_2,'holes');%填充孔洞
se=ones(3);%3*3模板
f2=imdilate(f1,se,'same');%膨胀操作
R_3=bwperim(f2);%提取边界
figure;imshow(f1);title('轮廓图');
figure;imshow(R_3);title('图像边界');





