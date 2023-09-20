function hist_vector = calc_hist_vector(input_img)
hist_vector=zeros(1,256);
dim=size(input_img);
for i=1:dim(1)
    for j=1:dim(2)
        hist_vector(1,(input_img(i,j)+1))= hist_vector(1,(input_img(i,j)+1))+1;
    end
end
end
