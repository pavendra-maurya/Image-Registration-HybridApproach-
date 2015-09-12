A=imread('im.jpg');

A=im2bw(A);
figure,imshow(A);
%Structuring element

B2=[1 1 0 0 0 1 1 1 1 0 0];
m=floor(size(B2,1)/2);
n=floor(size(B2,2)/2);
%Pad array on all the sides
C=padarray(A,[m n],1);
D=false(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        matc=B2&Temp;
if(matc==B2)
D(i,j)= 1  ;    
else
  D(i,j)=0;
    
end
         
    end
end

figure,imshow(D);


%Pad array on all the sides
C=padarray(D,[m n]);
E=false(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        E(i,j)=max(max(Temp&B2));
    end
end

figure,imshow(E);
clear all