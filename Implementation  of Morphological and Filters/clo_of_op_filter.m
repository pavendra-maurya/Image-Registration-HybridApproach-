% OPENING.....

A=imread('mr2.jpg');
A=imnoise(A,'salt & pepper',.01);

A=im2bw(A);
figure,imshow(A);
%Structuring element

B2=[0 1 0;1 1 1;0 1 0];
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



%CLOSING.....


%Dilation.....

%Pad array on all the sides
C=padarray(E,[m n]);
H=false(size(E));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        H(i,j)=max(max(Temp&B2));
    end
end

figure,imshow(H);

% erosion....
C=padarray(H,[m n],1);
I=false(size(H));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        matc=B2&Temp;
if(matc==B2)
I(i,j)= 1  ;    
else
  I(i,j)=0;
    
end
         
    end
end

figure,imshow(I);
snr1=usnr(I,A)
psnr1=upsnr(I,A)
clear all