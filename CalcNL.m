function fi=CalcNL(xx,nn,Lx)
    %this function evaluates each term of 
    % a Lagrange POLYNOMIAL
    % of DEGREE nn-1 
    % at the POINT xx
    % with element length Lx
    % number of nodes is nn 
    % number of DOF is nn 
    fi=ones(nn,1); %Initializing the function 
    Dx=Lx/(nn-1); %Interval length between nodes
    Xi=0:Dx:Lx; %x-coordinate of each node
    for ii=1:nn
        Temp1=1;
        for jj=1:nn
            if jj!=ii
                Temp1=Temp1*(xx-Xi(jj))/(Xi(ii)-Xi(jj));
            endif
        endfor
        fi(ii)=Temp1;
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
