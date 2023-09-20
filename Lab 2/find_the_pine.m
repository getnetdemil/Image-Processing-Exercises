function pine = find_the_pine(I)
    HSV = rgb2hsv(I);
    
    tmp = HSV(1,1,1);
    
    pine = zeros(size(HSV, 1), size(HSV, 2));
    
    
    for x = 1:size(HSV, 1)
        for y = 1:size(HSV, 2)
            if abs(tmp - HSV(x,y,1)) > 0.1
                pine(x,y) = 1;
            end
        end
    end
end