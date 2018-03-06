clear all
clc
close all 

Nne=5;
nn=Nne*2-1;

LengthX=1;
LengthY=1;
E=10.92;
Nu=0.3;
Thickness=1;

Nx=1;
Ny=1;

Lx=double(LengthX/Nx);
Ly=double(LengthY/Ny);

Q=Thickness*Thickness*Thickness/12* ...
   [   E/(1-Nu*Nu),Nu*E/(1-Nu*Nu), 0 ; ...
    Nu*E/(1-Nu*Nu),   E/(1-Nu*Nu), 0 ; ...
    0             ,0             , 2*E/2/(1+Nu)];
DP=Thickness*Thickness*Thickness/12*E/(1-Nu*Nu);
T1=CalcTinv(Lx,Ly,nn);
[KB,FB]=CalcLinear(Q,T1,Lx,Ly,nn);
%KB=T1'*KB*T1;
%FB=T1'*FB;
[KE,FE]=CalcLinearExact(Q,T1,Lx,Ly,nn);
[KL,FL]=CalcLinearLaplace(Q,Lx,Ly,Nne);

%cond(KB)

vvB=sort((real(eig(KB))));
vvE=sort((real(eig(KE))));
vvL=sort((real(eig(KL))));
[vvB(1:10),vvE(1:10),vvL(1:10)]

%Nodes=zeros(Nne*Nne,8);
%BCindex=0;
%for jj=1:Nne
%    for ii=1:Nne
%        NNN=(jj-1)*Nne+ii;
%        for kk=1:4
%            Nodes(NNN,kk)=4*(NNN-1)+kk;        
%            Nodes(NNN,kk+4)=0;
%            if or(ii==1,or(jj==1,or(ii==Nne,jj==Nne)))
%                BCindex=BCindex+1;
%                BCs(BCindex)=Nodes(NNN,kk);
%            endif
%        endfor
%    endfor
%endfor
%BCsC=1:Nne*Nne*4;
%BCsC(BCs)=[];
%
%Kred=KB;
%Kred(BCs,:)=[];
%Kred(:,BCs)=[];
%
%Fred=DP*FB;
%Fred(BCs)=[];
%
%Displ=Kred\Fred;
%
%Displacements=zeros(Nne*Nne*4,1);
%Displacements(BCsC)=Displ;
%
%for ii=1:Nne*Nne
%    Nodes(ii,5:8)=Displacements(Nodes(ii,1:4));
%endfor
%
%
%for ii=1:21
%    xx=(ii-1)*0.05;
%    for jj=1:21;
%        yy=(jj-1)*0.05;
%        uexact(ii,jj)=CalcU(xx,yy);
%        LoadEx(ii,jj)=CalcUxxxx(xx,yy)+2*CalcUxxyy(xx,yy)+CalcUyyyy(xx,yy);
%    endfor
%endfor
%for ii=1:21
%    xx=(ii-1)*0.05;
%    for jj=1:21;
%        yy=(jj-1)*0.05;
%        HH=CalcHw(xx,yy,nn)';
%        uu(ii,jj)=HH*T1*Displacements;
%    endfor
%endfor
%
%figure(1)
%mesh(LoadEx) 
%
%figure(2)
%mesh(uexact)   
%
%figure(3)
%mesh(uu)
%
%(uexact(10,10)-uu(10,10))/uexact(10,10)