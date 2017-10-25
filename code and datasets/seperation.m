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

%----------------------seperation-------------------------------%
Dist=zeros(m,2);
List=zeros(m,2);
kn=input('enter k value \n');
flist=zeros(1,kn+1);
Sep=zeros(1,k);
weight=zeros(m,k);
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
    count2=zeros(1,k);
    for v=2:1:kn+1
        for w=1:1:k
        for y=1:1:m
            if flist(1,v)==group(w,y)
               count2(1,w)=count2(1,w)+1;
                weight(i,w)=count2(1,w);
                
            end
            
        end
        end
    end
    [a,b]=ind2sub(size(group),find(group==i));
  
  for v=1:1:k
        if a==v
            for b=1:1:k
                if b~=a
                       
                    Sep(1,a)=Sep(1,a)+(weight(i,b)/10);
                    
                end
            end
            
                
        end          
    end

end

for x=1:1:k
    Sep(1,x)=Sep(1,x)/count(1,x);
end
MSep=max(Sep);
MSep