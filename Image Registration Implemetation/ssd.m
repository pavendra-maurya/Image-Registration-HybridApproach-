function [ outp ] = ssd(fixed,moving)
[m n]=size(fixed);

moving=imresize(moving,[m n],'bicubic');
 k=(fixed-moving);
        k=k.*k;
z=sum(sum(k))/m*n;
outp=z;

end

