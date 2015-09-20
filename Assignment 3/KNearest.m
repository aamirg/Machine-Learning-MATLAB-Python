function Unn=Unn(k)
load fisheriris
CVO=cvpartition(species,'K',10);
err=zeros(CVO.NumTestSets,1);

y = species;
X = meas;
%k=3;
for i=1:CVO.NumTestSets
    trIdx=CVO.training(i);
    teIdx=CVO.test(i);
    
    train=[];
    test=[];
    
    for x=1:length(trIdx)
        
        if trIdx(x)==1
            temp=[x,meas(x:x,1:4)];
            train=[train;temp];
        else
            temp=[x,meas(x:x,1:4)];
            test=[test;temp];
        end
    end
       train;
       test;
    ytest=knn(k,test,train,species);
    b=0;
    for m=1:numel(ytest)
       A= test(m:m,1:1);
       %disp(strcmp(ytest{m},species(A)));
       b=b+(~strcmp(ytest{m},species(A)));
    end
    err(i)=b;
end
Nr=sum(err);
Dr=numel(species);
accuracy=(1-(Nr/Dr))*100


 