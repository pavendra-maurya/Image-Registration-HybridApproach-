% erosion of grayscale image on the basis of different type of  structure 
function ero=erosionofgrayscale2(A,B)

B2=B;
% A=imread('mr2.jpg');
% 
% A=rgb2gray(A);
% figure,imshow(A);
% %Structuring element 
% B2=[10 10 10];

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
               Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n)-B2(k+m+1,l+n+1);
            end
        end
       
        D(i,j)=min(min(Tempp));
         
        
    end
end
ero=D;
