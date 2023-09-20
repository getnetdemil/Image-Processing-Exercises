function B = random_dither(A)
dim=size(A);
B=A;
random=rand(dim(1),dim(2));
for i=1:dim(1)
    for j=1:dim(2)
        B(i,j)=A(i,j)+random(i,j);
    end
end
    B=B > 1;
end
