% erosion of grayscale image on the basis of different type of  structure 

A=imread('mr2.jpg');

A=rgb2gray(A);
%A=imnoise(A,'gaussian',0.03,.02);
figure,imshow(A);
%Structuring element 
B2=[1 1 1];
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
               if(B2(k+m+1,l+n+1)==1)
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n);
                    
                end
            end
        end
        D(i,j)=min(min(Tempp));
         
        
    end
end
figure,imshow(D);

% Dilation of grayscale image on the basis of different type of  structure 


%Pad array on all the sides
C=padarray(D,[m n]);
%  D=false(size(A));
  E=D;
Tempp=[];
for i=1:size(D,1)
    for j=1:size(D,2)
        for k=-m:m
            for l=-n:n
               if(B2(k+m+1,l+n+1)==1)
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n);
                    
                end
            end
        end
       
        E(i,j)=max(max(Tempp));
      
        
    end
end
figure,imshow(E);

% Dilation of grayscale image on the basis of different type of  structure 

%Pad array on all the sides
C=padarray(E,[m n]);
%  D=false(size(A));
  F=E;
Tempp=[];
for i=1:size(E,1)
    for j=1:size(E,2)
        for k=-m:m
            for l=-n:n
               if(B2(k+m+1,l+n+1)==1)
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n);
                    
                end
            end
        end
       
        F(i,j)=max(max(Tempp));  
        
    end
end
figure,imshow(F);
% erosion of grayscale image on the basis of different type of  structure 


%Pad array on all the sides
C=padarray(F,[m n]);
%  D=false(size(A));
  G=F;
Tempp=[];
for i=1:size(F,1)
    for j=1:size(F,2)
       for k=-m:m
            for l=-n:n
               if(B2(k+m+1,l+n+1)==1)
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n);
                    
                end
            end
        end
       
        G(i,j)=min(min(Tempp));
         
        
    end
end
figure,imshow(G);

clear all