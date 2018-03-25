function Hw=NxyMult(fi,gj,nn,qq)
    %This function evaluates each term 
    % of a 2-D polynomial by multiplying
    % the terms of the respective polynomials
    % at point xx,yy
    %Each side of the element has nn nodes
    %Each node has (qq+1)^2 DOF
    %The multiplication is performed PRESERVING
    % the order of the DOF with respect to the nodes
    Hw=zeros((qq+1)*(qq+1)*nn*nn,1);
    q12=(qq+1)*(qq+1);
    for jj=1:nn
        jPointer=2*jj-1;
        for ii=1:nn 
            Nnode=ii+(jj-1)*nn;
            iPointer=2*ii-1;
            for kk=1:qq+1
                for ll=1:qq+1
                    Hw(q12*(Nnode-1)+(kk-1)*(qq+1)+ll)=fi(iPointer+ll-1)*gj(jPointer+kk-1);
                endfor
            endfor
        endfor
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682