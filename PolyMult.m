function Hw=PolyMult(fi,gj,nn)
    %This function evaluates each term 
    % of a 2-D polynomial by multiplying
    % the terms of the respective polynomials
    % at point xx,yy
    %Each side of the element has nn nodes
    %The polynomials are of 2nn-1 degree
    %The multiplication is performed PRESERVING
    % the order of the DOF with respect to the nodes
    Hw=zeros(4*nn*nn,1);
    for jj=1:nn
        jPointer=2*jj-1;
        for ii=1:nn 
            Nnode=ii+(jj-1)*nn;
            iPointer=2*ii-1;
            Hw(4*Nnode-3)=fi(iPointer)*gj(jPointer);
            Hw(4*Nnode-2)=fi(iPointer+1)*gj(jPointer);
            Hw(4*Nnode-1)=fi(iPointer)*gj(jPointer+1);
            Hw(4*Nnode)=fi(iPointer+1)*gj(jPointer+1);
        endfor
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682