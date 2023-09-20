function [r_vect, t_vect] = non_max_sup(A, k, p)
r_vect=[];
t_vect=[];

while k>0
    [~,ind]=max(A(:));
    [row, column]=ind2sub(size(A),ind);
    r_vect=[r_vect,row];
    t_vect=[t_vect,column];
    x_1=max(row-p,1);
    x_2=min(row+p,size(A,1));
    y_1=max(column-p,1);
    y_2=min(column+p,size(A,2));
    A(x_1:x_2,y_1:y_2)=0;
    k=k-1;
end
end


https://www.mathworks.com/matlabcentral/answers/266446-how-to-calculate-degree-of-similarity-between-two-images#answer_208407
https://www.mathworks.com/matlabcentral/answers/296598-rotation-angle-between-two-images