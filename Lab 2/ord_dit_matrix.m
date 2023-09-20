function D = ord_dit_matrix(n)
D=zeros(2^n);
if n>0
    for i=1:n
        D=[4*D+0 4*D+2; 4*D+3 4*D+1]; 
    end
end
D=D/(4^n);
    
end