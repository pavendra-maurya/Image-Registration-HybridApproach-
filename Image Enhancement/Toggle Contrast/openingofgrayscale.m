% erosion of grayscale image on the basis of different type of  structure 
function ope=openingofgrayscale(A,B2)
eroo=erosionofgrayscale2(A,B2);
% Dilation of grayscale image on the basis of different type of  structure 
E=dilationofgrayscale2(eroo,B2);
ope=E;
