I = imread('lm.jpg');
[row,col,~] = size(I);
X=[1+round((col-1)*rand(10000,1)),1+round((row-1)*rand(10000,1))];% roundȡ�� rand(1000,0)����1000*1���������
%TRI = delaunay(X) ���ڵ����� X ����һ����ά����ά Delaunay �����ʷ֡��ñ���֧���Ծ����ʽ����㡣
%X �Ĵ�СΪ mpts��ndim������ mpts �ǵ�����ndim �ǵ����ڿռ��ά�ȣ�2 �Q ndim �Q 3����������ʷֵ�Ч��֧�� 2 ����� 3 ��������﷨��ר�ú����������ʷ֡�
tri = delaunay(X);
ns=length(tri);%
I=double(I);
for i=1:ns
    patch(X(tri(i,:),1),col*ones(3,1)-X(tri(i,:),2),[I(X(tri(i,2),2),X(tri(i,2),1),1)/255, ...
I(X(tri(i,2),2),X(tri(i,2),1),2)/255, I(X(tri(i,2),2),X(tri(i,2),1),3)/255],'edgecolor','none');
end
axis equal;