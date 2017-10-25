clc;

%--------------- Initializing the dataset of flowers ---------------------%

load iris.txt 
DataSet=iris;
      load iinput.txt
Input=iinput;
[m,n]=size(DataSet);
      %----------------------- Selecting 3 random centres
      %----------------------% 
c=input('enter  max number of clusters  \n');
kn=input('enter k value \n');
sum1=zeros(1,c);
for cn=2:1:c
fprintf('for clusers %d   \n',cn);
    for i=1:cn
    d=Input(cn-1,i);
    Centre(i,1:n)=DataSet(d,1:n);
    group(i,1:m)=zeros(1,m);
    Mean(i,1:n)=zeros(1,n);
    nCentre(i,1:n)=zeros(1,n);
end

while flag<=cn
flag=1;
    count=zeros(1,cn);
    for i=1:cn
    group(i,1:m)=zeros(1,m);
    Mean(i,1:n)=zeros(1,n);
    end
%Finding the minimum distance
for i=1:1:m
    LessDist=zeros(1,cn);
    for g=1:1:cn
        Pattern=0;
        for p=1:1:n
Pattern=Pattern+(Centre(g,p)-DataSet(i,p))^2;
        end
       Pattern=sqrt(Pattern);
LessDist(1,g)=Pattern;
    end
Minimum=min(LessDist);

%Finding the new centre
for j=1:1:cn
    if (Minimum==LessDist(1,j))
        count(1,j)=count(1,j)+1;
        Mean(j,1:n)=Mean(j,1:n)+DataSet(i,1:n);
        group(j,count(1,j))=i;
    end
end
end
for j=1:1:cn
    nCentre(j,1:n)=Mean(j,1:n)/count(1,j);
end
for j=1:1:cn
    if Centre(j,1:n)==nCentre(j,1:n)
       flag=flag+1;
  end
end
Centre=nCentre;
end

%-------------------Compactness-------------------------------------%

Compact=zeros(1,cn);
Pattern1=0;

for a=1:1:cn
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
    
Compact(1,a)=(2/count1*(count1-1))*Pattern2;
Compact(1,a)
end
Sum1(1,cn)=sum(Compact);
Sum1

%-------------------Separation----------------------------------%

Dist=zeros(m,2);
List=zeros(m,2);

flist=zeros(1,kn+1);
Sep=zeros(1,cn);
weight=zeros(m,cn);
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
    count2=zeros(1,cn);
    for v=2:1:kn+1
        for w=1:1:cn
        for y=1:1:m
            if flist(1,v)==group(w,y)
               count2(1,w)=count2(1,w)+1;
                weight(i,w)=count2(1,w);
                
            end
            
        end
        end
    end
    [a,b]=ind2sub(size(group),find(group==i));
  
  for v=1:1:cn
        if a==v
            for b=1:1:cn
                if b~=a
                       
                    Sep(1,a)=Sep(1,a)+(weight(i,b)/10);
                    
                end
            end
            
                
        end          
    end

end

for x=1:1:cn
    Sep(1,x)=Sep(1,x)/count(1,x);
end
MSep(1,cn)=max(Sep);
MSep

end
cvnn=zeros(1,c);
%---------------------CVNN---------------------------------%
for cv=2:1:c
cnorm=0;
cnorm=Sum1(1,cv)/max(Sum1);
snorm=0;
snorm=MSep(1,cv)/max(MSep); 
cvnn(1,cv)=cnorm+snorm;


end
cvnn