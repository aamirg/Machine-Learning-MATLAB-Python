%naivebayes(fruits,{'not long','sweet','yellow'},Type)

function nbayes = nbayes(fruits,new,Type)
total_fruit=0;

indv_fruit=[]; %store count of each type of fruit
evid=[]; %store probabilities of each attribute - Evidence
prior=[]; %store prior probabilities

n=size(fruits);

%Count total fruit and indv_fruit of a kind
for a=1:n(1)
    sum=0;
    for b=1:2
        sum=sum+fruits(a,b);
    end
    indv_fruit=[indv_fruit,sum];
    total_fruit=total_fruit+sum;
end
total_fruit;
indv_fruit;

%calculate prior probabilities
for a=1:n(1)
    prior=[prior,indv_fruit(a)/total_fruit];
end
prior;

%calculate probability of evidence
for a=1:n(2)
    sum=0;
    for b=1:n(1)
        sum=sum+fruits(b,a);
    end
    evid=[evid,sum/1000];
end
evid;

%calculate likelihood of each fruit and store in attrb vector
long=[];
not_long=[];
sweet=[];
not_sweet=[];
yellow=[];
not_yellow=[];

for a=1:n(1)
    
long=[long,fruits(a,1)/indv_fruit(a)];
not_long=[not_long,fruits(a,2)/indv_fruit(a)];
sweet=[sweet,fruits(a,3)/indv_fruit(a)];
not_sweet=[not_sweet,fruits(a,4)/indv_fruit(a)];
yellow=[yellow,fruits(a,5)/indv_fruit(a)];
not_yellow=[not_yellow,fruits(a,6)/indv_fruit(a)];

end

long;,not_long;,sweet;,not_sweet;,yellow;,not_yellow;

%Classify the fruit described by vector new {long,sweet,yellow}
sort(new);
computeNr = prior;
computeDr = [1];
for b=1:length(new)
for fruit=1:n(1)
    if strcmpi(new(b),'long')
       computeNr(fruit)=computeNr(fruit)*long(fruit);
       if fruit==1
       computeDr=computeDr*evid(1);
       end
    end  
    if strcmpi(new(b),'not long')
        computeNr(fruit)=computeNr(fruit)* not_long(fruit);
        if fruit==1
        computeDr=computeDr*evid(2);
        end
    end
    if strcmpi(new(b),'sweet')
        computeNr(fruit)=computeNr(fruit)*sweet(fruit);
        if fruit==1
        computeDr=computeDr*evid(3);
        end
    end
    if strcmpi(new(b),'not sweet')
        computeNr(fruit)=computeNr(fruit)*not_sweet(fruit);
        if fruit==1
        computeDr=computeDr*evid(4);
        end 
    end
    if strcmpi(new(b),'yellow')
        computeNr(fruit)=computeNr(fruit)*yellow(fruit);
       if fruit==1
        computeDr=computeDr*evid(5);
       end
    end
    if strcmpi(new(b),'not yellow')
        computeNr(fruit)=computeNr(fruit)*not_yellow(fruit);
       if fruit==1
        computeDr=computeDr*evid(6);
       end 
    end
end
end
computeNr;
computeDr;
x=computeNr/computeDr;
[val,index] = max(x);
s='The input tuple is a - ';
s=strcat(s,Type{index});
disp(s)
val