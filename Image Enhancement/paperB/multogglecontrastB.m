A=imread('mr2.jpg');
A=rgb2gray(A);
% A=imnoise(A,'salt & pepper',0.03);
B1=[1];
B1=dilatioofstr(B1,1);
B2=[0 1 0;1 1 1;0 1 0];
B2=dilatioofstr(B2,2);
B3=[0 0 1 0 0;0 0 1 0 0;1 1 1 1 1;0 0 1 0 0;0 0 1 0 0];
B3=dilatioofstr(B3,3);
B4=[0 0 0 1 0 0 0;0 0 0 1 0 0 0;1 1 1 1 1 1 1;0 0 0 1 0 0 0;0 0 0 1 0 0 0];
B4=dilatioofstr(B4,4);

 for ff=1:4
     temp=A;
if (ff==1)
    B=B1;
elseif(ff==2)
    B=B2;
elseif(ff==3)
    B=B3;
else
    B=B4;
end

di=dilationofgrayscale2(A,B);
eo=erosionofgrayscale2(A,B);
for i=1:size(A,1)
    for j=1:size(A,2)
     if((di(i,j)-A(i,j))<(A(i,j)-eo(i,j)))
         temp(i,j)=di(i,j);
     elseif((di(i,j)-A(i,j))>(A(i,j)-eo(i,j)))
         temp(i,j)=eo(i,j);
     else
       temp(i,j)=A(i,j);
     end
        
    end
end
 if (ff==1)
    temp1=temp;
elseif(ff==2)
temp2=temp;
 elseif(ff==3)
    temp3=temp;
    else
    temp4=temp;
 end
 end
 figure,imshow(temp1);
 figure,imshow(temp2);
figure,imshow(temp3);
figure,imshow(temp4);
temp5=(temp1+temp2+temp3+temp4)/4;
figure,imshow(temp5);
snr1=usnr(temp5,A)
psnr1=upsnr(temp5,A)
clear all