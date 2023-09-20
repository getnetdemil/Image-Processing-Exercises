function [LUT, M] = mykmeans(S, k)

[LUT, M] = step1_initialization(S, k);
    converge = 0;
    n = 0;
    while(converge == 0 && n < 100)
        LUT = step2_assignment(S, k, LUT, M);
        M_old = M;
        M = step3_update(S, k, LUT, M);
        
        felt = sum(abs(M - M_old).^2);
        
        if (felt < 0.02)
            converge = 1;
        end
        
        n = n + 1;
    end
    
    fprintf('The number of Iteration is %d.\n', n);

end




