
function  [ outp ]=  morphologicalfilter(A)
% erosion of grayscale image on the basis of different type of  structure 

B2=[0 1 0;1 1 1;0 1 0];

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
             
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n)+B2(k+m+1,l+n+1);
                    
                
            
            end
        end
       
        E(i,j)=max(max(Tempp));
      
        
    end
end

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
              
             
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n)+B2(k+m+1,l+n+1);
                    
                
            
            end
        end
       
        F(i,j)=max(max(Tempp));  
        
    end
end

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
             
                    Tempp(k+m+1,l+n+1)=C(i+k+m,j+l+n)-B2(k+m+1,l+n+1);
                    
                
            
            end
        end
       
        G(i,j)=min(min(Tempp));
         
        
    end
end
outp=G;