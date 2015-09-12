A=imread('mr2.jpg');

A=rgb2gray(A);
figure,imshow(A);
%Structuring element 
B2=[1 1 1;1 1 1;1 1 1];
m=floor(size(B2,1)/2);
n=floor(size(B2,2)/2);
%Pad array on all the sides
C=padarray(A,[m n]);
%  D=false(size(A));
  D=A;
Tempp=[];
for i=1:size(A,1)
    for j=1:size(A,2)
        for k=-m:m
            for l=-n:n
               B2(k+m+1,l+n+1)
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n)-B2(k+m+1,l+n+1);
                    
                
            end
        end
       
        D(i,j)=max(max(Tempp));
         
        
    end
end

figure,imshow(D);

clear all