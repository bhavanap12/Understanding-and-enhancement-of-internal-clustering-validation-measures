clc;

%--------------- Initializing the dataset of flowers ---------------------%
load iris.txt 
DataSet=iris;
      
[m,n]=size(DataSet);
Dist=zeros(m,2);
List=zeros(m,2);
kn=input('enter k value \n');
flist=zeros(1,kn+1);
for i=1:1:m
    for j=1:1:m
         Pattern=0;
        for p=1:1:n
Pattern=Pattern+(DataSet(i,p)-DataSet(j,p))^2;
        end
       Pattern=sqrt(Pattern);
    Dist(j,1)=j;
    Dist(j,2)=Pattern;
    end
    List=sortrows(Dist,2);
    for u=1:1:kn+1
   flist(1,u)=List(u,1);
    end
    for v=2:1:kn+1
        if flist(1,v)
end


