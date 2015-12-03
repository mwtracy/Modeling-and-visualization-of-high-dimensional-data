clear all;
load('iris');

[m n] = size(X);
[pc v]= pca1(X);
g = pc(:,1:3);
data = g'*X

subplot(311)
for i =1:n
    
   if y(i)==1 
       plot(data(1,i), data(2,i),'r*')
       
   end
   if y(i)==2
       plot(data(1,i), data(2,i),'gO')
   end
   if y(i)==3
       plot(data(1,i), data(2,i), 'bx')
       
   end
   
      xlabel('PC1');
      ylabel('PC2');
      title('Data in PC1-PC2 subspaces');
      
      
   hold on 
end
subplot(312)
for i =1:n
    
   if y(i)==1 
       plot(data(1,i), data(3,i),'r*')
       
   end
   if y(i)==2
       plot(data(1,i), data(3,i),'gO')
   end
   if y(i)==3
       plot(data(1,i), data(3,i), 'bx')
       
   end
   xlabel('PC1');
   ylabel('PC3');
   title('Data in PC1-PC3 subspaces');
  hold on 
end
subplot(313)
for i =1:n
    
   if y(i)==1 
       plot(data(2,i), data(3,i),'r*')
       
   end
   if y(i)==2
       plot(data(2,i), data(3,i),'gO')
   end
   if y(i)==3
       plot(data(2,i), data(3,i), 'bx')
       
   end
    xlabel('PC2');
    ylabel('PC3');
    title('Data in PC2-PC3 subspaces');
   hold on
end
