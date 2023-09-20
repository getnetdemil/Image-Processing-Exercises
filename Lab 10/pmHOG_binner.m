function H = pmHOG_binner(PHI, MAG)

H=zeros(1,9);
mini= -90;
maxi= -70;
for i=1:9
    LOG_MASK=  (PHI >= mini & PHI < maxi);
    H(1,i)=sum(MAG(LOG_MASK));
    mini=mini+20;
    maxi=maxi+20;
    
end
