clc;
clear all;
fixed=imread('mr2.jpg');
fixed=rgb2gray(fixed);
figure,imshow(fixed);
title('Fixed image');

I=imread('mr1.jpg');

I=rgb2gray(I);
figure,imshow(I);
title('Moving image');
ssssd=ssd(fixed,I)
% I=medianfilter(I);
  I=morphologicalfilter(I);
figure
imshow(I);
title(' After filtering by morphologicalfilter');
[optimizer,met]=imregconfig('multimodal');

%....Change the optimizer Propertise.....
optimizer.InitialRadius = 0.006;
optimizer.Epsilon = 1.5e-4;
optimizer.GrowthFactor = 1.01;
optimizer.MaximumIterations = 1000;


imreg=imregister(I,fixed,'similarity',optimizer,met);
figure,imshowpair(fixed,imreg);
title('Registraton of image on the basis of similarity');
ssdS=ssd(fixed,imreg)


recoverd=RegisterGeometric(fixed,imreg);
  recoverd=multogglecontrast(recoverd);
 figure,imshow(recoverd);
 title('Registraton of image on the basis of Geomerticaltransform');
figure, imshowpair(fixed,recoverd);
ssdF=ssd(fixed,recoverd)
title('Overlaping of two image,Refrence image and Traget image');