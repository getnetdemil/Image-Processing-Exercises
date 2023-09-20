function [PHI, MAG] = pmHOG_gradient(I)   

Hx= [-1 0 1];
Hy= transpose([-1 0 1]);
I=double(I);
Gx= imfilter(I,Hx,'replicate','same');
Gy= imfilter(I,Hy,'replicate','same');
MAG=sqrt(Gx.^2 + Gy.^2);
PHI=rad2deg(atan(Gy./Gx));

end
