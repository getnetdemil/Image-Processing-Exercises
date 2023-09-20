function [H] = my_hough(input_img)
dim=size(input_img);
r_max=sqrt((dim(1))^2 + (dim(2))^2);
r_max=round(r_max);
theta=180;
H=zeros(2*r_max+1,theta);
for x=1:dim(1)
    for y=1:dim(2)
        if input_img(x,y)>0
            for theta=1:180
                r= x*cosd(theta)+y*sind(theta);
                r=round(r);
                H(r+r_max+1,theta)= H(r+r_max+1,theta)+1;
            end
        end
    end
end
end
