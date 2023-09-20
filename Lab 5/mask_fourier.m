function newF = mask_fourier(F, x, y, r)
F=fftshift(F);
x=round(x);
y=round(y);
for i=1:numel(x)
    F(y(i)-r: y(i)+r,x(i)-r:x(i)+r)=0+0i;
end
newF=ifftshift(F);
end
