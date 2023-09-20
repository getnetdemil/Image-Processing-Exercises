function norm_HOG = pmHOG_extractHOG(I)

dim=size(I);
h=dim(1)/8;
w=dim(2)/8;
norm_HOG=zeros(h-1,w-1,36);
c=0;
a=0;
for i=1:8:dim(1)-8
    a=a+1;
    c=0;
    for j=1:8:dim(2)-8
        c=c+1;
        Selected_block= I(i:i+15,j:j+15);
        feature_vector= [];
        
        for n=1:8:16
            for m=1:8:16
                
                Selected_cell=Selected_block(n:n+7,m:m+7);
                [phase, magnitude] = pmHOG_gradient(Selected_cell);
                Cell_histogram = pmHOG_binner(phase, magnitude);
                feature_vector=[feature_vector,Cell_histogram];
            end
        end
        feature_vector = feature_vector / sum(feature_vector);
        norm_HOG(a,c,:)=feature_vector;
        
    end
    
end

end
