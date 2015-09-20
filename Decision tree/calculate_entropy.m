function f=calculate_entropy(Rev_data, col_number)
 
    col_unique=unique(Rev_data(:,col_number));
    Fruit_unique=[1:1:3];
   
        
   values=zeros( length(col_unique),length(Fruit_unique));
    
   for j=1: length(Rev_data(:,2))
       for i=1: length(Fruit_unique)
           temp= Rev_data(j, col_number);
           
           c=Rev_data(j,1);
           if i ~= Rev_data(j,1)
               continue;
           else
           if temp==  1   
                values(temp,i)= values(temp, i)+1;
           end
           if temp==2   
               values(temp, i)= values(temp, i)+1;
           end
            if temp==3 
                values(temp, i)= values(temp, i)+1;
            end
           end
       end 
   end
   
   f=values;
           
end
   
  