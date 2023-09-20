function output_img = myconv(input_img, kernel)
kernelsize=size(kernel);
r1=(kernelsize(1)-1)/2;
r2=(kernelsize(2)-1)/2;
output_image=padarray(input_img,[r1 r2],0,'both');
output_img=input_img;
Kernel=rot90(kernel,2);
for i=1:(size(output_image,1)-(kernelsize(1)-1))
    for j=1:(size(output_image,2)-(kernelsize(2)-1))
        output_img(i,j)=sum(sum(output_image(i:i+kernelsize(1)-1 , j:j+kernelsize(2)-1).*Kernel));
    end
end
       
end
