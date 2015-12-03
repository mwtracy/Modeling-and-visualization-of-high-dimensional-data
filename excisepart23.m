function excisepart23()

load digit ;
traindata = decohdata(train);
[PC V] = pca2(traindata);
[M N] = size(traindata);
means = mean(traindata, 2);
meandata = repmat(means,1,N);



% from the train, we use the low-dimensional is 47 
F = PC(:,1:47)
Newtraindata  = F'*(traindata-meandata); 
 
assignin('base', 'Newtraindata', Newtraindata);
testdata = decohdata(test);
Newtestdata  = F'*testdata; 
assignin('base', 'Newtestdata', Newtestdata);
assignin('base', 'Fdata', F);
end


function Fulldata = decohdata(data)
   [~,Ni] = size(data); % 300 examples
   tmp = data{1};
   [m n]= size(tmp);
   Fulldata = zeros(m*n, Ni)
    for i = 1:Ni
        tmp=data{i};
        Fulldata(:,i)= tmp(:);
        
    end
   
end

function Pov_dimension = pov(V,n) 
    v1 = sum(V(1:n));
    Pov_dimension = v1/sum(V);
end