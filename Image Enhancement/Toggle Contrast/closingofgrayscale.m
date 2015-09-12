%dilation of grayscale image on the basis of different type of  structure 

function clo=closingofgrayscale(A,B2);

dilll=dilationofgrayscale2(A,B2);

% erosion of grayscale image on the basis of different type of  structure 

E=erosionofgrayscale2(dilll,B2);
clo=E;