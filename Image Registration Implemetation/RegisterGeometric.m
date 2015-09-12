function [ output_args ] =RegisterGeometric(fixed,moving )
scale=0.7;
moving=imresize(fixed,scale);
ptsOriginal=detectSURFFeatures(fixed);
ptsDistorted=detectSURFFeatures(moving);
[featuresOrignal,validPtsOriginal]=extractFeatures(fixed,ptsOriginal);
[featuresDistorted,validPtsDistorted]=extractFeatures(moving,ptsDistorted);
indexPairs=matchFeatures(featuresOrignal,featuresDistorted);
matchedOriginal=validPtsOriginal(indexPairs( :,1));
matchedDistorted=validPtsDistorted(indexPairs( :,2));
figure;
showMatchedFeatures(fixed,moving,matchedOriginal,matchedDistorted);
title('Matched SURF points, including outliers');
[tform ,inlierDistorted,inlinerOriginal]=estimateGeometricTransform(matchedDistorted,matchedOriginal,'similarity');
figure;
showMatchedFeatures(fixed,moving,inlinerOriginal,inlierDistorted);
title('match point inliner only');
Tinv=tform.invert.T;
ss=Tinv(2,1);
sc=Tinv(1,1);
scaleRecoverd=sqrt(ss*ss+sc*sc)
thetaRecoverd=atan2(ss,sc)*180/pi
outputView=imref2d(size(fixed));
recoverd=imwarp(moving,tform,'OutputView',outputView);
output_args=recoverd;


