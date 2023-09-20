function B = ordered_dither(I, D)
B=I;
dimI=size(I);
dimD=size(D);
D=repmat(D,(dimI(1)/dimD(1)),(dimI(2)/dimD(2)));
 B(B > D) = 1;
 B(B < D) = 0;
    
    
end
