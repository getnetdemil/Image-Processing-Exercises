function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        
        
        
        summa_deltaE = 0;
        cycle = cycle + 1;
        for y = 1:h
            for x = 1:w
                
                Actual_Class_Label = mrf.classmask(y, x);
                Labels = [];
                
                for y_neighbours = max(1, y - 1):min(h, y + 1)
                    for x_neighbours = max(1, x-1):min(w, x+1)
                        if y_neighbours ~= y || x_neighbours ~= x
                           Labels = [Labels, mrf.classmask(y_neighbours, x_neighbours)];
                        end
                    end
                end
                
                Actual_Posterior_Probability = mrf.logProbs{Actual_Class_Label}(y, x);
                Actual_Prior_Probability= (beta * (sum(Labels(:) ~= Actual_Class_Label))) - (beta * (sum(Labels(:) == Actual_Class_Label)));
                New_Labels_of_Class = randi([1, cnum]);
                
                while New_Labels_of_Class == Actual_Class_Label
                    New_Labels_of_Class = randi([1, cnum]);
                end 
                
                New_Posterior_Probability = mrf.logProbs{New_Labels_of_Class}(y, x);
                New_Prior_Probability = (beta * (sum(Labels(:) ~= New_Labels_of_Class))) - (beta * (sum(Labels(:) == New_Labels_of_Class)));
                
                U_act = Actual_Posterior_Probability + Actual_Prior_Probability;
                U_new = New_Posterior_Probability + New_Prior_Probability;
                dU = U_new - U_act;
                r = rand();
                
                if dU < 0 || (dU > 0 && r< exp(-dU/T))
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y, x) = New_Labels_of_Class;
                end
            end
        end
        T = T * c;
        
        
        
        
        
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
