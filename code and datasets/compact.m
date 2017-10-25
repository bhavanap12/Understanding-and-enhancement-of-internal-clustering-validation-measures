clc;

%--------------- Initializing the dataset of flowers ---------------------%
load iris.txt 
DataSet=iris;
      
[m,n]=size(DataSet);
      %----------------------- Selecting 3 random centres
      %----------------------% 
k=input('enter  number of clusters  \n');
for i=1:k
    d=input ('enter initial cluster centre ');
    Centre(i,1:n)=DataSet(d,1:n);
    group(i,1:m)=zeros(1,m);
    Mean(i,1:n)=zeros(1,n);
    nCentre(i,1:n)=zeros(1,n);
end

while flag<=k
flag=1;
    count=zeros(1,k);
    for i=1:k
    group(i,1:m)=zeros(1,m);
    Mean(i,1:n)=zeros(1,n);
    end
%Finding the minimum distance
for i=1:1:m
    LessDist=zeros(1,k);
    for g=1:1:k
        Pattern=0;
        for p=1:1:n
Pattern=Pattern+(Centre(g,p)-DataSet(i,p))^2;
        end
       Pattern=sqrt(Pattern);
LessDist(1,g)=Pattern;
    end
Minimum=min(LessDist);

%Finding the new centre
for j=1:1:k
    if (Minimum==LessDist(1,j))
        count(1,j)=count(1,j)+1;
        Mean(j,1:n)=Mean(j,1:n)+DataSet(i,1:n);
        group(j,count(1,j))=i;
    end
end
end
for j=1:1:k
    nCentre(j,1:n)=Mean(j,1:n)/count(1,j);
end
for j=1:1:k
    if Centre(j,1:n)==nCentre(j,1:n)
       flag=flag+1;
  end
end
Centre=nCentre;
end


%-------------------------------Compactness

Compact=0;
Pattern1=0;
Sum=0;
for a=1:1:k
    count1=count(1,a);
    Pattern2=0;
    for i=1:1:count1
    for j=i+1:1:count1
         Pattern1=0;
        for p=1:1:n
Pattern1=Pattern1+(DataSet(group(a,i),p)-DataSet(group(a,j),p))^2;

        end
        Pattern2=Pattern2+sqrt(Pattern1);
    end
    end
    
Compact=(2/count1*(count1-1))*Pattern2;
%count1
Compact
Sum=Sum+Compact;
end
Sum
