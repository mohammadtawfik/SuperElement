function KKK=CalcLinearExact2D4DOF(Q,LengthX,LengthY,nn)
%This function evaluae the Element Stiffness Matrix
% for a THIN PLATE element with:
%LengthX = length in the x-direction
%LengthY = length in the y-direction
%Q       = the plate stiffness matrix 3x3
%nn      = shape function degree in one direction
%The plate has (nn+1)^2 DOF
%4 DOF per node w,wx,wy,wxy

%NOTE: Transformation matrix not included 
% in function arguments to provide more 
% flexibility in the modification of the code
% THUS, the returned values should be multiplied 
% by the transformation matrix.


%Initializing stiffness matrix 
KB=zeros((nn+1)*(nn+1),(nn+1)*(nn+1));
%If you want ot evaluate more matrices
% DO NOT FORGET to initialize them here

for ii=1:(nn+1)*(nn+1)
    ki=mod(ii-1,nn+1)+1;
    li=(ii-ki)/(nn+1) + 1;
    ki1=max(0,ki-1);
    ki2=max(0,ki-2);
    li1=max(0,li-1);
    li2=max(0,li-2);
    for jj=1:(nn+1)*(nn+1)
        kj=mod(jj-1,nn+1)+1;
        lj=(jj-kj)/(nn+1) + 1;
        kj1=max(0,kj-1);
        kj2=max(0,kj-2);
        lj1=max(0,lj-1);
        lj2=max(0,lj-2);
        
        kij5=max(1,ki+kj-5);
        kij3=max(1,ki+kj-3);
        kij1=max(1,ki+kj-1);
        lij5=max(1,li+lj-5);
        lij3=max(1,li+lj-3);
        lij1=max(1,li+lj-1);
        
        a1=LengthX^(ki+kj-1);
        a3=LengthX^(ki+kj-3);
        a5=LengthX^(ki+kj-5);
        b1=LengthY^(li+lj-1);
        b3=LengthY^(li+lj-3);
        b5=LengthY^(li+lj-5);
        
        Alpha1=ki1*ki2*kj1*kj2/kij5/lij1*a5*b1;
        Alpha2=li1*li2*kj1*kj2/kij3/lij3*a3*b3;
        Alpha3=ki1*ki2*lj1*lj2/kij3/lij3*a3*b3;
        Alpha4=li1*li2*lj1*lj2/kij1/lij5*a1*b5;
        Alpha5=ki1*li1*kj1*lj1/kij3/lij3*a3*b3;
        
        KB(ii,jj)=Q(1,1)*Alpha1+Q(1,2)*Alpha2+ ...
                  Q(2,2)*Alpha3+Q(2,2)*Alpha4+ ...
                  4*Q(3,3)*Alpha5;
    endfor
endfor
        
      KKK= KB;
      
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682