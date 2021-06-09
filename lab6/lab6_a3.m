%在上一个实验（实验十七）处理结果的基础上，完成：
%对最大连通分量内部孔洞区域进行填充，并显示填充结果
%提取上述填充后图像的边界并显示

imag=imread('17-刘德华.jpg');
figure;imshow(imag);title('原图');
%二值化
G=imag(:,:,2);%选择G通道
thresh=234;%手动设置门限，大约为白色的灰度值
G_2=im2bw(G,thresh/255);%二值化
a=G_2<0.5;b=G_2>0.5;%得到0,1的索引
G_2(a)=1;G_2(b)=0;%将黑白倒转
figure;imshow(G_2);title('二值化后的图像');

%连通分量提取
cc=bwconncomp(G_2)%连通分量数目
L=bwlabel(G_2,4);%为连通分量编号
count=tabulate(L(:));%出现次数
num=count(2:end,2); %各个连通分量中1出现的次数
index=find(num==max(num));%最大分量出现的位置
M=(L==index);%输出最大连通分量
figure;imshow(M);title('最大连通分量');

%孔洞填充和边界提取
f1=imfill(M,'holes');%填充孔洞
se=ones(3);%3*3模板
f2=imdilate(f1,se,'same');%膨胀操作
M_2=bwperim(f2);%提取边界
figure;imshow(f1);title('轮廓图');
figure;imshow(M_2);title('图像边界');





