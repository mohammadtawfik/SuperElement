function fi=CalcN(xx,nn,Lx)
    %this function evaluates each term of 
    % a Modified Lagrange POLYNOMIAL
    % of DEGREE 2*nn-1 
    % at the POINT xx
    % with element length Lx
    % number of nodes is nn 
    % number of DOF is 2*nn 
    fi=ones(2*nn,1); %Initializing the function 
    Dx=Lx/(nn-1); %Interval length between nodes
    Xi=0:Dx:Lx; %x-coordinate of each node
    for ii=1:nn
        Temp=0;
        for jj=1:nn
            if jj!=ii
                Temp=Temp+(1/(Xi(ii)-Xi(jj)));
            endif
        endfor
        Temp1=1;
        for jj=1:nn
            if jj!=ii
                Temp1=Temp1* ...
                ((xx-Xi(jj))*(xx-Xi(jj)))/ ...
                ((Xi(ii)-Xi(jj))*(Xi(ii)-Xi(jj)));
            endif
        endfor
        fi(2*ii-1)=Temp1*(1-2*(xx-Xi(ii))*Temp);
        fi(2*ii)=(xx-Xi(ii))*Temp1;
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
