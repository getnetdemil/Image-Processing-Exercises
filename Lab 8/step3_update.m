function M = step3_update(S, k, LUT, M)
    
    for j = 1:k
        clusterrr = LUT == j;
        sub_s = S(clusterrr,:);
        M(j,:) = mean(sub_s,1);
    end

end







