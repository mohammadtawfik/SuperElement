clear all
nn=2;
qq=1;

xi=0.;
Alpha=0;

XX=0:1/(nn-1):1;

Tk=CalcTk1D(XX,nn,qq);


Gk0=CalcGk1D(xi,XX,nn,qq,0);
Gk1=CalcGk1D(xi,XX,nn,qq,1);
Gk2=CalcGk1D(xi,XX,nn,qq,2);
Gk3=CalcGk1D(xi,XX,nn,qq,3);

cb0=[];
cb1=[];
cb2=[];
cb3=[];
for ii=1:nn 
    cb0=[cb0,Gk0(:,ii)'*Tk(:,:,ii)];
    cb1=[cb1,Gk1(:,ii)'*Tk(:,:,ii)];
    cb2=[cb2,Gk2(:,ii)'*Tk(:,:,ii)];
    cb3=[cb3,Gk3(:,ii)'*Tk(:,:,ii)];
endfor 
cb0
cb1
cb2
cb3


CalcAqi(xi,XX,nn,qq,Alpha)
CalcBqi0(xi,XX,nn,qq)
CalcBqi1(xi,XX,nn,qq)
CalcBqi2(xi,XX,nn,qq)
CalcBqi3(xi,XX,nn,qq)
