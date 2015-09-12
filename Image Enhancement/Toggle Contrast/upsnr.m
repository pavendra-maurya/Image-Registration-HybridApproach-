function upsnr=upsnr(outi,inpui)
 [m n]=size(inpui);
 pixa=m*n;
 mes=0.0;
outt=(outi-inpui);
outt=outt.*outt;
mes=sum(sum(outt));
 mes=(mes)/pixa;
 af=(255*255)/mes;
 upsnr=20*log((af))/log(10);

