%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facial Expression LSH-PCA-LDA
% Version : 2.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function SN=renoise1(mm)
stat=0;
len=0;
start=0;
for i=1 : 375
    len=-1;
    for j=1 : 299
        len=len+1;
        if mm(i,j)~=mm(i,j+1) && mm(i,j+1)==0
            if len>0 && len<=35
                for o=(j-len) : j
                    mm(i,o)=mm(i,j+1);
                end
            end
            len=-1;
        end
    end
end
SN=mm;
end