function [LUT, M] = step1_initialization(S, k)
    
    m = size(S, 1);  
    n = size(S, 2);
    LUT = zeros(1,m);
    M = zeros(k,n);
    d = floor(m/k);
    
    
    for i = 1:k
        for j = 1:n
            M(i,j) = S(i*d-d+1,j);
        end
    end
    
        
end





