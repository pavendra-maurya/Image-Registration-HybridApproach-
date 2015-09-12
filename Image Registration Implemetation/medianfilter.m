function [out_put]=medianfilter(A)
N=3;
M=N;
t=floor(N/2);
y=floor(M/2);
[m n] = size(A); 
Y=zeros(m+2,n+2);
Y(2:m+1,2:n+1)=A;
z=A;

for i=t+1:m+1
    for j=y+1:n+1
           k=Y(i-t:i+t,j-y:j+y);
            z(i-1,j-1) = median(k(:));
    end
end 


out_put=z;


