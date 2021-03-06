% This part is that reconstruct this images to the orginals by testdata

function testadata_()

load digit ;
traindata = decohdata(train)
testdata = decohdata(test);
[M N] = size(testdata);
means = mean(testdata, 2);
meandata = repmat(means,1,N);

[PC V] = pca2(traindata);


% After the train, we choice the number of the eignvalue is 47 
FeatureVector = PC(:,1:47)
Finaldata = FeatureVector'*(testdata-meandata);
%we use the FeatureVector to get the reconstruct data and the orginal data
% Use the eignvetor to multiple the traindata(this data is the dataadjust by the means-data)
Orginaldata  = meandata +FeatureVector*Finaldata; 

Err = zeros(1)
for i=1:N
  %  Err = zeros(1)
    Err = Err + (testdata(:,i)-Orginaldata(:,i))'*(testdata(:,i)-Orginaldata(:,i));
    
end
 
Error = Err /N;

subplot(121)
tmp1 = reshape(testdata(:,3),28,28);
display_digit(tmp1);
title('Original image, test{3}');
subplot(122)
tmp = reshape(Orginaldata(:,3),28,28);
display_digit(tmp);
title('reconstruct image;test{3};dim =47');

assignin('base', 'Error', Error);
assignin('base', 'Orginaldata', Orginaldata);
assignin('base', 'traindata', testdata);
assignin('base', 'Finaltraindata', Finaldata);
testdata = decohdata(test);
Newtestdata  = FeatureVector'*testdata; 
assignin('base', 'Newtestdata', Newtestdata);
assignin('base', 'Featurevectordata', FeatureVector);
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