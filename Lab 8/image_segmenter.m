function [O] = image_segmenter(I, k)

    h = size(I, 2);
    w = size(I, 1);
    S = reshape(I,h*w,3);
    [LUT, M] = mykmeans(S, k);
    A=zeros(size(LUT, 2), size(M, 2));
    for i = 1:size(LUT, 2)
        A(i,:) =  M(LUT(i), :);
    end

    O = reshape(A,h,w,3);
end



