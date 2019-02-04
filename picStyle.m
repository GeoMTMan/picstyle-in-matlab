I = imread('lm.jpg');
[row,col,~] = size(I);
X=[1+round((col-1)*rand(10000,1)),1+round((row-1)*rand(10000,1))];% round取整 rand(1000,0)生成1000*1的随机数组
%TRI = delaunay(X) 基于点坐标 X 创建一个二维或三维 Delaunay 三角剖分。该变体支持以矩阵格式定义点。
%X 的大小为 mpts×ndim，其中 mpts 是点数，ndim 是点所在空间的维度，2 ≦ ndim ≦ 3。输出三角剖分等效于支持 2 输入或 3 输入调用语法的专用函数的三角剖分。
tri = delaunay(X);
ns=length(tri);%
I=double(I);
for i=1:ns
    patch(X(tri(i,:),1),col*ones(3,1)-X(tri(i,:),2),[I(X(tri(i,2),2),X(tri(i,2),1),1)/255, ...
I(X(tri(i,2),2),X(tri(i,2),1),2)/255, I(X(tri(i,2),2),X(tri(i,2),1),3)/255],'edgecolor','none');
end
axis equal;