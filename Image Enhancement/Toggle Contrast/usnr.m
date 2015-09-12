function usnr=usnr(outi,inpui)
outii=outi;
inpuii=inpui;
[m n]=size(inpuii);
 pixa=m*n;
 messs=0.0;
outtt=(outii-inpuii);
outtt=outtt.*outtt;
messs=sum(sum(outtt));
inpuii=(inpuii.*inpuii);
inpuii=sum(sum(inpuii));
 af=inpuii/messs;
 usnr=20*log((af))/log(10);

