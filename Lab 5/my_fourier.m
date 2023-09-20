function [F] = my_fourier(I)
dim=size(I);
F=zeros(dim(1),dim(2));
for k1=1:dim(1)
    for k2=1:dim(2)
        for n1=1:dim(1)
            for n2=1:dim(2)
                F(k1,k2)=F(k1,k2) + I(n1,n2)* (exp(-1i*2*pi*(k1-1)*(n1-1)/dim(1)))* (exp(-1i*2*pi*(k2-1)*(n2-1)/dim(2)));
            end
        end
    end
end
end
