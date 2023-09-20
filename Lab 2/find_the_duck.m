function duck = find_the_duck(I)
I = squeeze(I(:, :, 3));
duck=I<128;
end
    
    


	