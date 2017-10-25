clear all
disp('Clustering Validation');
while(true)
    %disp('1.SINGLE LABEL CLASSIFICATION(SL-KNN)');
    %ch=input('enter choice');
    ch=menu('Clustering Validation','Compactness','Separation','CVNN','EXIT');
    switch ch
        case 1
            compact;
            
       case 2
           seperation;
        case 3
            trial;
        otherwise
          break;
    end
end