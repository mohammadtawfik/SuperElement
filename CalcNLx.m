function fi=CalcNLx(xx,nn,Lx)
    %this function evaluates each term of 
    % the first derivative of a Lagrange POLYNOMIAL
    % of DEGREE nn-1 
    % at the POINT xx
    % with element length Lx
    % number of nodes is nn 
    % number of DOF is nn 
    fi=ones(nn,1); %Initializing the function 
    Dx=Lx/(nn-1); %Interval length between nodes
    Xi=0:Dx:Lx; %x-coordinate of each node
    for ii=1:nn
        Temp0=0;
        for kk=1:nn 
            if kk!=ii
                Temp1=1;
                for jj=1:nn
                    if and(jj!=ii,jj!=kk)
                        Temp1=Temp1*(xx-Xi(jj))/(Xi(ii)-Xi(jj));
                    endif
                endfor
                Temp0=Temp0+Temp1/(Xi(ii)-Xi(kk));
            endif
        endfor
        fi(ii)=Temp0;
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
