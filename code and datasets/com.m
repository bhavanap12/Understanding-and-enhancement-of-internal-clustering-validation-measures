clc;

load cluster1.txt;
DataSet=cluster1;
[m,n]=size(DataSet);
Pattern=0;
for i=1:1:m
    for j=i+1:1:m
Pattern=Pattern+sqrt((DataSet(i,1)-DataSet(j,1))^2+(DataSet(i,2)-DataSet(j,2))^2+(DataSet(i,3)-DataSet(j,3))^2+(DataSet(i,4)-DataSet(j,4))^2);
    end
end
Compact=(2/m*(m-1))*Pattern;
Compact