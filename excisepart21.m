function excisepart21()

load spambase ;
%traindata = decohdata(train);
[PC V] = pca2(traindata);
 
 dimom = 20 ;
 pov1 = pov(V,dimom);
 p = 1:300;
  for i =1:300
      p(i) = pov(V,i);

  end
  i =1:300;
  % plot the pov with the number of dimensionals and then implement the 
  % plot we can find the reltionship between the dimensional and the pov
  % pov range0.9 and 0.95
 plot(i, p);

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