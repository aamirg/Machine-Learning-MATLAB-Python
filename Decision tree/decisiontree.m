file1=dataset('file','fruits_decisionTree.csv','delimiter',',');
n=size(file1);
label={'long','short','sweet','sour','yellow','orange','green','Banana','Orange','Other'};
Revised_data=zeros(n(1),n(2));

plotter_inc=1;

prompt='Enter :';
str=input(prompt, 's');
Input=strsplit(str,',');


for i=1:n(1)
    for j=1:n(2)
        c=dataset2cell(file1(i,j));
        for k=1:length(label)
            label{k};
            
            s=strcmpi(c{2,1},label{k});
            if (s==1)
                if k==1
                    Revised_data(i,j)=1;
                elseif k==2
                    Revised_data(i,j)=2;
                    
                elseif k==3
                    Revised_data(i,j)=1;
                    
                elseif k==4
                    Revised_data(i,j)=2;
                    
                elseif k==5
                    Revised_data(i,j)=1;
                elseif k==6
                    Revised_data(i,j)=2;
                elseif k==7
                    Revised_data(i,j)=3;
                elseif k==8
                    Revised_data(i,j)=1;
                elseif k==9
                    Revised_data(i,j)=2;
                else
                    Revised_data(i,j)=3;
                end
            end        
        end
    end
end

information_gain=0;
  
    information_gain=find_split(Revised_data(:,1));
    gain_array=zeros(1,3);
    k=1;
    for i=2:length(Revised_data(1,:))
     v= calculate_entropy(Revised_data,i);
     ig=calculate_info_gain(v);
     
      gain_array(1,k)=information_gain-ig;
      k=k+1;
      
    end  
   [ v,i]=max(gain_array);
   z=0;
   tree_plotting=[z];
   z=z+1;
   
   for h=1:length(unique(Revised_data(:,i+1)))
   tree_plotting=[tree_plotting,z];
   end
   
   z=z+1; 
   
   f=0;
   f=create_submatrix(Revised_data, i); 

   size_f=size(f);
   
   unique_key=unique(f(:,i));
   
  print_label={};
  
  index_value=0;
  index_change=zeros(3,1);
  k=1;
  for j=1: length(f(:,i+1))
      
      if f(j,i+1)~=index_value
          index_value=f(j,i+1);
          index_change(k,1)=j;
          k=k+1;
      end
  end
  
index_change(k,1)=j+1;
  
information_gain_level_1=zeros(3,1);
 
 for m=1: length(index_change)-1
     
    x=index_change(m,1);
    y=index_change(m+1,1);
    
    y=y-1;
    information_gain_level_1(m,1)=find_split(f((x:y),1));    
 end
 
 f=f(1:100, 1:i);
     
 k=1;
 size_of_f=size(f);
 column_number=1;
 
p=1;
gain_array=zeros(1,2);
     
     for k=1:length(index_change)-1
      
          for n=2:size_of_f(2) %column iteration
             x=index_change(k,1);
                 y=index_change(k+1,1);
                 y=y-1;
                 
                passing_matrix=f((x:y),: );
                 mat= calculate_entropy( passing_matrix ,n);
                ig=calculate_info_gain(mat);
                gain_array(1,n-1)=information_gain_level_1(k,1)-ig;
          end
             [mat,i]=max(gain_array);
          
     end
  
    for g1=1:length(unique(Revised_data(:,i+1)))
    tree_plotting=[tree_plotting,z];
    end
    z=z+1;
    tree_plotting=[tree_plotting,z];
    z=z+1; 
    
    for g2=1:(length(index_change)-1)
    tree_plotting=[tree_plotting,z];
    tree_plotting=[tree_plotting,z];
    z=z+1;
    end
    
    
  index_change_old=index_change; %to save the index change of previous values   
  w=1;
  tree_plotting=[tree_plotting,3];
  
  for g3=1:(length(index_change)-1)
  tree_plotting=[tree_plotting,z];
  tree_plotting=[tree_plotting,z];
  z=z+1;
  end
  
  for  q=1:length(index_change_old)-1
      g=index_change_old(q);
      b=index_change_old(q+1);
      b=b-1;
  passing_matrix=create_submatrix(f(g:b,:), i);
     
  index_value=0;
  index_change=zeros(3,1);
  k=1;
  for j=1: length(passing_matrix(:,i+1))    
      if passing_matrix(j,i+1)~=index_value
          index_value=passing_matrix(j,i+1);
          index_change(k,1)=j;
          k=k+1;
      end
  end

index_change(k,1)=j+1;

n=3;
p=1;
 
for k=1:length(index_change)-1
                   
              x=index_change(k,1);
              y=index_change(k+1,1);
              y=y-1;
                 
              new_mat=passing_matrix((x:y),: );  
              m= calculate_entropy( new_mat ,n);
              
          size_of_m=size(m);
          maximum=0;
          pos=1;
        
         count_zero=0;
          for s=1:size_of_m(1)
             for l=1:size_of_m(2)
                if m(s,l)==0
                    count_zero=count_zero+1;
                end
             end
            
              h=m(s,:);
              [value,index]=max(h);
              maximum_arr(p,w)=index;
            
              
              p=p+1;
            
          end     
end
w=w+1;
  end
  
  for g4=1:11
      tree_plotting=[tree_plotting,z];
       z=z+1;
  end


if strcmp(Input(1), 'Green') || strcmpi(Input(1), 'green')
    
    if strcmp(Input(2), 'long') || strcmpi(Input(2), 'Long')
        
        if strcmp(Input(3), 'sour') || strcmp(Input(3), 'Sour')
            
            disp('Banana');
        elseif strcmp(Input(3), 'sweet') || strcmp(Input(3), 'Sweet')
            disp('Banana');
            
        end
    elseif strcmp(Input(2), 'short') || strcmp(Input(2), 'Short')
           if strcmp(Input(3), 'sour') || strcmp(Input(3), 'Sour')
              disp('Other');
           elseif strcmp(Input(3), 'sweet') || strcmp(Input(3), 'Sweet')
               disp('Banana');
           end
    end
        
        
    
elseif strcmp(Input(1), 'ORANGE') 
    if strcmp(Input(2), 'long') || strcmp(Input(2), 'Long')
        disp('Other');
    elseif strcmp(Input(2), 'short') || strcmp(Input(2), 'Short')
        if strcmp(Input(3), 'sour') || strcmp(Input(3), 'Sour')
            disp('orange');
            elseif strcmp(Input(3), 'sweet') || strcmp(Input(3), 'Sweet')
             disp('orange');
        end
    end

elseif strcmp(Input(1), 'yellow') || strcmp(Input(1), 'Yellow')  
     if strcmp(Input(2), 'long') || strcmp(Input(2), 'Long')
          if strcmp(Input(3), 'sour') || strcmp(Input(3), 'Sour')
              disp('Banana');
          elseif strcmp(Input(3), 'sweet') || strcmp(Input(3), 'Sweet')
              disp('Banana');
          end
     elseif strcmp(Input(2), 'short') || strcmp(Input(2), 'Short')
         if strcmp(Input(3), 'sour') || strcmp(Intput(3), 'Sour')
             disp('Banana');
         elseif strcmp(Input(3), 'sweet') || strcmp(Input(3), 'Sweet')
             disp('Banana');
         end
     end
end

treeplot(tree_plotting);
coordinates = get(gca,'Children');
xCoordinates = get(coordinates(2) ,'XData');
yCoordinates = get(coordinates(2) ,'YData');

text(xCoordinates(1),yCoordinates(1),'Color');
text(xCoordinates(2),yCoordinates(2),'Length');
text(xCoordinates(3),yCoordinates(3),'Length');
text(xCoordinates(4),yCoordinates(4),'Length');
text(xCoordinates(5),yCoordinates(5),'Sweetness');
text(xCoordinates(6),yCoordinates(6),'Sweetness');
text(xCoordinates(7),yCoordinates(7),'Sweetness');
text(xCoordinates(8),yCoordinates(8),'Sweetness');
text(xCoordinates(9),yCoordinates(9),'Sweetness');
text(xCoordinates(10),yCoordinates(10),'fruit');
text(xCoordinates(11),yCoordinates(12),'fruit');
text(xCoordinates(13),yCoordinates(13),'fruit');
text(xCoordinates(14),yCoordinates(14),'fruit');
text(xCoordinates(15),yCoordinates(15),'fruit');
text(xCoordinates(16),yCoordinates(16),'fruit');
text(xCoordinates(17),yCoordinates(17),'fruit');
text(xCoordinates(18),yCoordinates(18),'fruit');
text(xCoordinates(19),yCoordinates(19),'fruit');
text(xCoordinates(20),yCoordinates(20),'fruit');




text((xCoordinates(1)+xCoordinates(2))./2,(yCoordinates(1)+yCoordinates(2))./2,'yellow');
text((xCoordinates(1)+xCoordinates(3))./2,(yCoordinates(1)+yCoordinates(3))./2,'orange');
text((xCoordinates(1)+xCoordinates(4))./2,(yCoordinates(1)+yCoordinates(4))./2,'green');
text((xCoordinates(2)+xCoordinates(5))./2,(yCoordinates(2)+yCoordinates(5))./2,'long');
text((xCoordinates(2)+xCoordinates(6))./2,(yCoordinates(2)+yCoordinates(6))./2,'short');
text((xCoordinates(3)+xCoordinates(7))./2,(yCoordinates(3)+yCoordinates(7))./2,'short');
text((xCoordinates(4)+xCoordinates(8))./2,(yCoordinates(4)+yCoordinates(8))./2,'long');
text((xCoordinates(4)+xCoordinates(9))./2,(yCoordinates(4)+yCoordinates(9))./2,'short');
text((xCoordinates(5)+xCoordinates(10))./2,(yCoordinates(5)+yCoordinates(10))./2,'sour');
text((xCoordinates(5)+xCoordinates(11))./2,(yCoordinates(5)+yCoordinates(11))./2,'sweet');
text((xCoordinates(6)+xCoordinates(12))./2,(yCoordinates(6)+yCoordinates(12))./2,'sour');
text((xCoordinates(6)+xCoordinates(13))./2,(yCoordinates(6)+yCoordinates(13))./2,'sweet');
text((xCoordinates(3)+xCoordinates(14))./2,(yCoordinates(3)+yCoordinates(14))./2,'long');
text((xCoordinates(7)+xCoordinates(15))./2,(yCoordinates(7)+yCoordinates(15))./2,'sour');
text((xCoordinates(7)+xCoordinates(16))./2,(yCoordinates(7)+yCoordinates(16))./2,'sweet');
text((xCoordinates(8)+xCoordinates(17))./2,(yCoordinates(8)+yCoordinates(17))./2,'sour');
text((xCoordinates(8)+xCoordinates(18))./2,(yCoordinates(8)+yCoordinates(18))./2,'sweet');
text((xCoordinates(9)+xCoordinates(19))./2,(yCoordinates(9)+yCoordinates(19))./2,'sour');
text((xCoordinates(9)+xCoordinates(20))./2,(yCoordinates(9)+yCoordinates(20))./2,'sweet');
text((xCoordinates(10)+xCoordinates(21))./2,(yCoordinates(10)+yCoordinates(21))./2,'banana');
text((xCoordinates(11)+xCoordinates(22))./2,(yCoordinates(11)+yCoordinates(22))./2,'banana');
text((xCoordinates(12)+xCoordinates(23))./2,(yCoordinates(12)+yCoordinates(23))./2,'banana');
text((xCoordinates(13)+xCoordinates(24))./2,(yCoordinates(13)+yCoordinates(24))./2,'banana');
text((xCoordinates(14)+xCoordinates(25))./2,(yCoordinates(14)+yCoordinates(25))./2,'other');
text((xCoordinates(15)+xCoordinates(26))./2,(yCoordinates(15)+yCoordinates(26))./2,'orange');
text((xCoordinates(16)+xCoordinates(27))./2,(yCoordinates(16)+yCoordinates(27))./2,'orange');
text((xCoordinates(17)+xCoordinates(28))./2,(yCoordinates(17)+yCoordinates(28))./2,'banana');
text((xCoordinates(18)+xCoordinates(29))./2,(yCoordinates(18)+yCoordinates(29))./2,'banana');
text((xCoordinates(19)+xCoordinates(30))./2,(yCoordinates(19)+yCoordinates(30))./2,'other');
text((xCoordinates(20)+xCoordinates(31))./2,(yCoordinates(20)+yCoordinates(31))./2,'banana');





        

    

