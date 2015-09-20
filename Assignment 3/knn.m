function predicted=knn(k,test,train,species)

n=size(test);
meas_size=size(train);

predicted = cell(1,n(1));

for a=1:n(1)
    h = test(a:a,2:5);
    M=[];
    index=[];
    for b=1:meas_size(1)
        j=[];
        org_index=train(b);
        i=train(b:b,2:5); %extract meas row
        j=[h;i];  %combine meas row and input row into a matrix
        z=pdist(j);  % find euclidean dist
        value=[z,org_index];
        M=[M;value];
    end     
Mcopy=M;
sorted=sort(Mcopy);

NN=sorted(1:k,1:1);
no=size(Mcopy);

for e=1:size(NN)
    for f=1:no(1)
        if (NN(e)==Mcopy(f:f,1:1));
           index=[index,Mcopy(f:f,2:2)];
           Mcopy(f:f,1:1)=100;
           break
        end
    end
end
index;
Mcopy;
    
labels={'setosa','versicolor','virginica'};
flag=[0,0,0];

for i=1:length(index)
    if strcmpi(species(index(i)),'setosa')
        flag(1)=flag(1)+1;
    elseif strcmpi(species(index(i)),'versicolor')
        flag(2)=flag(2)+1;
    elseif strcmpi(species(index(i)),'virginica')
        flag(3)=flag(3)+1;
    end 
end
[val,i]=max(flag);
predicted{a}=labels(i);
flag;
end
