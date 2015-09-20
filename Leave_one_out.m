load fisheriris

cp=cvpartition(species,'LeaveOut')

LDA=@(xtrain,ytrain,xtest,ytest)(classify(xtest,xtrain,ytrain));
ldaCVerr=crossval('mcr',meas(:,1:2),species,'predfun',LDA,'partition',cp);

Accuracy=(1-ldaCVerr)

y = species;
X = meas;
order = unique(y); % Order of the group labels

f = @(xtr,ytr,xte,yte)confusionmat(yte,...
classify(xte,xtr,ytr),'order',order);

cfMat = crossval(f,X,y,'partition',cp);
cfMat = reshape(sum(cfMat),3,3)

for i=1:size(cfMat)
    total=0;
    for j=1:size(cfMat)
        total=total+cfMat(i,j);
    end
    acc=cfMat(i,i)/total;
    order(i),acc
end
