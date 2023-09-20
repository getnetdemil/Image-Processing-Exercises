function LUT = step2_assignment(S, k, LUT, M)

    m = size(S, 1);  
    n = size(S, 2);
    for i = 1:m
        dif = zeros(1,k);
        for j = 1:k
            dif(j) = sum((S(i,:) - M(j, :)).^2);
        end
        [~, min_dif] = min(dif);
        LUT(i) = min_dif;
    end
    
end





