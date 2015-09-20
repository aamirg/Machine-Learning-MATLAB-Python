function f= create_submatrix(Revised_data, index)
n= size(Revised_data);                  % size of revised data
attributes=unique(Revised_data(:,index+1));                 % unique values of the attribute column, its a column matrix 
n1=size(attributes);                                    

new_matrix=zeros(n(1),n(2));
count_unique=zeros(1,n1(1));                    %  it stores the count of the long and short                    

for j=1:n1(1)                           %iterating over the loop of long and short 
    for i=1:n(1)
         if(Revised_data(i,index+1)==attributes(j))
             count_unique(j)=count_unique(j)+1;
         end
    end
end

y=1;
for j=1:n1(1)                           %iterating over the loop of long and short 
    for i=1:n(1)
         if(Revised_data(i,index+1)==attributes(j))
             new_matrix(y,:)=Revised_data(i,:);
             y=y+1;
         end
    end
end

f=new_matrix;
end
