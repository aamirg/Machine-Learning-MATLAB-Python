function information_gain=find_split(col)
   
entropy=0;
count_1=0;
count_2=0;
count_3=0;
count_0=0;
information_gain=0;
entropy=zeros(1,4);
S=unique(col);

    for i=1: length(col)
        
        if col(i,1)==1
            count_1=count_1+1;
        end
        if col(i,1)==2
            count_2=count_2+1;
        end
        if col(i,1)==3
            count_3=count_3+1;
        end
        if col(i,1)==0
            count_0=count_0+1;
        end
    end
    
    total=count_1+count_2+count_3+count_0;
  a=zeros(1,4);
   a(1,2)= -(count_1)/(total) * log2((count_1)/(total));
   a(1,3)= -(count_2)/(total) * log2((count_2)/(total));
   a(1,4)= -(count_3)/(total) * log2((count_3)/(total));
   a(1,1)= -(count_0)/(total) * log2((count_0)/(total));
   information_gain=0;
   for i=1: length(S)
       if S(i)==1
        information_gain=information_gain+a(1,2);
       elseif S(i)==2
         information_gain=information_gain+a(1,3);
       elseif S(i)==3
           information_gain=information_gain + a(1,4);
       elseif S(i)==1
           information_gain=information_gain + a(1,1);
       end
   end   
end                   