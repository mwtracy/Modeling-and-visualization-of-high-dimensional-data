% This part is that reconstruct this images to the orginals by testdata

function twodpcatestadata_()

load digit ;
%traindata = decohdata(train)
%testdata = decohdata(test);
%[M N] = size(testdata);
%means = mean(testdata, 2);
%meandata = repmat(means,1,N);

[PC V] = twodpca(train);

suma =zeros(28,28);
for i= 1:10
    suma = suma +test{i};
    
end
    averageA = suma/10;
% After the train, we choice the number of the eignvalue is 47 
FeatureVector = PC(:,1:8);


Err = zeros(1)
N=10;
for i=1:N
  %  Err = zeros(1)
  Finaldata = (test{i}-averageA)*FeatureVector;
  Orginaldata  = averageA +Finaldata*FeatureVector'; 
    Err = Err + (test{i}(:)-Orginaldata(:))'*(test{i}(:)-Orginaldata(:));
end
 
Error = Err /N;

E = sum(sum(Error));


Finaldata = (test{3}-averageA)*FeatureVector;
%we use the FeatureVector to get the reconstruct data and the orginal data
% Use the eignvetor to multiple the traindata(this data is the dataadjust by the means-data)
Orginaldata  = averageA +Finaldata*FeatureVector'; 
subplot(121)
display_digit(Orginaldata);
title('PoV=0.9,dimension =8');
subplot(122)
display_digit(test{3})
title('Original image, test{3}');

assignin('base', 'E', E);
assignin('base', 'Error', Error);
assignin('base', 'Orginaldata', Orginaldata);
assignin('base', 'Featurevectordata', FeatureVector);
end


function Pov_dimension = pov(V,n) 
    v1 = sum(V(1:n));
    Pov_dimension = v1/sum(V);
end