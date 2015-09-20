function f= calculate_info_gain(v)

 
total=0;
split=0;
  k=1;


split=zeros(1,length(v(:,1)));
k=1;
n=size(v);

total_sum=0;

for i=1: n(1)
    for j=1: n(2)
        total_sum=total_sum+v(i,j);
    end
end
      
row_length=n(1);
col_length=n(2);
   
 for i=1:row_length
     total=0;
      total=sum(v(i,:));
      
   for j=1:col_length
    split(1,k)= (-(v(i,j)+0.1)/(total+0.1) * log2((v(i,j)+0.1)/(total+0.1))+split(1,k));
   end
  
   split(1,k)=split(1,k)*(total/total_sum);
    k=k+1;
 end
 
f=sum(split);

end