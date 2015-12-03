function twodpcapov()

load digit ;
%traindata = decohdata(train);
[PC V] = twodpca(train);
 
 dimom = 20 ;
 pov1 = pov(V,dimom);
 %p = 1:300;
 
 %here i want the pov equal is 90%, and get the dimension we need to choice
  for i =1:300
       pov1 = pov(V,i);
       if pov1>0.9
          dimom = i;
          break;
       end
  end
 %plot(traindata, pov1)
 dimom

end


%%function Fulldata = decohdata(data)
 %  [~,Ni] = size(data); % 300 examples
 %  tmp = data{1};
  % [m n]= size(tmp);
  % Fulldata = zeros(m*n, Ni)
   % for i = 1:Ni
  %      tmp=data{i};
 %       Fulldata(:,i)= tmp(:);
        
 %   end
   
%end

function Pov_dimension = pov(V,n) 
    v1 = sum(V(1:n));
    Pov_dimension = v1/sum(V);
end