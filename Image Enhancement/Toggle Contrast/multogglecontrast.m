A=imread('mr2.jpg');
A=rgb2gray(A);
 %A=imnoise(A,'speckle',0.003);
 figure,imshow(A);
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

fo=openingofgrayscale(A,B);
co=closingofgrayscale(A,B);
for i=1:size(A,1)
    for j=1:size(A,2)
     if((co(i,j)-A(i,j))<(A(i,j)-fo(i,j)))
         temp(i,j)=fo(i,j);
     elseif((co(i,j)-A(i,j))>(A(i,j)-fo(i,j)))
         temp(i,j)=co(i,j);
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
BTO1=max((A-temp1),0);
DTO1=max((temp1-A),0);
BTO2=max((A-temp2),0);
DTO2=max((temp2-A),0);
BTO3=max((A-temp3),0);
DTO3=max((temp3-A),0);
BTO4=max((A-temp4),0);
DTO4=max((temp4-A),0);
 bto=A;
 dto=A;
for i=1:size(A,1)
    for j=1:size(A,2)
        btooo=[BTO1(i,j),BTO2(i,j),BTO3(i,j),BTO4(i,j)];
     bto(i,j)=max(btooo);
     dtooo=[DTO1(i,j),DTO2(i,j),DTO3(i,j),DTO4(i,j)];
     dto(i,j)=max(dtooo);
    end
end
finallim=(A+1.0*bto-1.0*dto);
 figure,imshow(finallim);
  snr1=usnr(finallim,A)
 psnr1=upsnr(finallim,A)
clear all