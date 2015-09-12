% function  fun=cloopfilter(im)
%Dilation.....
%  A=imread(im);
 A=imread('im.jpg');
A=imnoise(A,'salt & pepper',.09);
A=im2bw(A);
figure,imshow(A);
%Structuring element
B2=[0 1 0;1 1 1;0 1 0];
m=floor(size(B2,1)/2);
n=floor(size(B2,2)/2);
%Pad array on all the sides
C=padarray(A,[m n]);
D=false(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        D(i,j)=max(max(Temp&B2));
    end
end

figure,imshow(D);

% erosion....
C=padarray(D,[m n],1);
E=false(size(D));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        matc=B2&Temp;
if(matc==B2)
E(i,j)= 1  ;    
else
  E(i,j)=0;
    
end
         
    end
end

figure,imshow(E);


%opening......



%Pad array on all the sides
C=padarray(E,[m n],1);
F=false(size(E));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        matc=B2&Temp;
if(matc==B2)
F(i,j)= 1  ;    
else
  F(i,j)=0;
    
end
         
    end
end

figure,imshow(F);


%Pad array on all the sides
C=padarray(F,[m n]);
G=false(size(F));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        G(i,j)=max(max(Temp&B2));
    end
end

figure,imshow(G);
snr1=usnr(G,A)
psnr1=upsnr(G,A)
clear all