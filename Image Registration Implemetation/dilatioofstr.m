function dil=dilatioofstr(str,n)
temp=str;
if(n==1)
temp=str;
end
for ii=2:n
    temp=temp+str;
end
dil=temp;