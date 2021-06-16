%读取实验数据包里面“21-刘德华.jpg”，从RGB通道中选择一个合适的通道，
%在面部选取合适的起始点和生长条件，利用区域分割方法对图像进行分割，
%要求分割结果基本能提取面部，显示分割结果。

imag=imread('21-刘德华.jpg');
figure;imshow(imag);title('原图');
imag = imag(:,:,1);%选择则R通道
figure;imshow(imag);title('R通道');
imag=im2double(imag);
[M,N]=size(imag);
x=0.5;y=0.4;%生成点，面部
x1=round(x*M);
y1=round(y*N);
seed=imag(x1,y1); %获取中心像素灰度值
region=zeros(M,N);
region(x1,y1)=1;

count=1; %待处理点个数
threshold=0.14;
while count>0
    count=0;
    for i=1:M %遍历整幅图像
    for j=1:N
        if region(i,j)==1 %点在“栈”内
        if (i-1)>1&(i+1)<M&(j-1)>1&(j+1)<N %3*3邻域在图像范围内
            for u=-1:1 %8-邻域生长
            for v=-1:1
                if region(i+u,j+v)==0&abs(imag(i+u,j+v)-seed)<=threshold
                    region(i+u,j+v)=1;
                    count=count+1;  %记录此次新生长的点个数
                end
            end
            end
        end
        end
    end
    end
end
figure;imshow(region);title("分割后的图像");