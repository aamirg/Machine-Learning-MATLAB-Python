load fisheriris
CVO=cvpartition(species,'K',10) 
err=zeros(CVO.NumTestSets,1);

y = species;
X = meas;

for i=1:CVO.NumTestSets
    trIdx=CVO.training(i);
    teIdx=CVO.test(i);
    ytest=classify(meas(teIdx,:),meas(trIdx,:),species(trIdx,:));
    err(i)=sum(~strcmp(ytest,species(teIdx)));
    
order = unique(y); % Order of the group labels

f = @(xtr,ytr,xte,yte)confusionmat(yte,...
classify(xte,xtr,ytr),'order',order);

cfMat = crossval(f,X,y,'partition',CVO);
cfMat = reshape(sum(cfMat),3,3)

end
cvErr=sum(err)/sum(CVO.TestSize);
Accuracy=(1-cvErr)*100

for i=1:size(cfMat)
    total=0;
    for j=1:size(cfMat)
        total=total+cfMat(i,j);
    end
    acc=cfMat(i,i)/total;
    order(i),acc
end
