function [t,p]=ComsolIn(filename)

%[Dat]=ComsolIn(filename)
%
%imports and corrects a comsol text file such that the data is an n by 2
%matrix with the first column being the time and the second column being
%the pressure level

Data=load(filename);

s=size(Data);

t=Data(2:2:s(1),1);
p=Data(1:2:s(1)-1,:);

for i=1:length(t)
  
    if t(i)<0
        t(i)=0;
        p(i,:)=zeros(1,s(2));
    end
    
end
