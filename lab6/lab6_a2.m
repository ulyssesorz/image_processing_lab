%读取实验数据包里面“17-刘德华.jpg”，完成：
%手动选择合适的通道和合适的阈值进行二值化，要求二值化结果基本能区分人物和背景，人物赋予1，背景赋予0，显示二值化后图像
%对上述二值化结果中数值为1的区域进行连通分量提取与编号排序，输出连通分量数目，显示最大连通分量

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





