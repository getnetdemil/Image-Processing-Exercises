function [score] = detectPedestrians(I, sample_HOG)
H = pmHOG_extractHOG(I);
R=H.* sample_HOG;
mask=R<=0.01;
R(mask)=0;
score=sum(sum(sum(R,'omitnan')));
end
