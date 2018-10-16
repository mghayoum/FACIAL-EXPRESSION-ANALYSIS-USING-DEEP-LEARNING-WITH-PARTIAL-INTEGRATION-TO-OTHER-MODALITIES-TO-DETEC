function x   =melbankm(p,n,fs,fl,fh)

eml.extrinsic('sparse');
w='m';
f0=700/fs;
fn2=floor(n/2);
lr=log((f0+fh)/(f0+fl))/(p+1);
% convert to fft bin numbers with 0 for DC term
bl=n*((f0+fl)*exp([0 1 p p+1]*lr)-f0);
b2=ceil(bl(2));
b3=floor(bl(3));
  b1=floor(bl(1))+1;
  b4=min(fn2,ceil(bl(4)))-1;
  pf=log((f0+(1:127)/n)/(f0+fl))/lr;
  fp=floor(pf);
  pm=pf-fp;
  k2=b2-b1+1;
  k3=b3-b1+1;
  k4=b4-b1+1;
  r=[fp(4:127) 1+fp(1:107)];
  c=[4:127 1:107];
  v=2*[1-pm(4:127) pm(1:107)];
  mn=b1+1;
  mx=b4+1;
  v=1-0.92/1.08*cos(v*pi/2);
    x=sparse(r,c+mn-1,v,p,1+fn2);