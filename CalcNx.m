function fi=CalcNx(xx,nn,Lx)
    %this function evaluates each term of
    % the FIRST derivative of 
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
        Temp=-2*Temp;
        Temp1=1;
        for jj=1:nn
            if jj!=ii
                Temp1=Temp1*((xx-Xi(jj))*(xx-Xi(jj)))/ ...
                ((Xi(ii)-Xi(jj))*(Xi(ii)-Xi(jj)));
            endif
        endfor
        Temp2=0;
        for jj=1:nn
            if jj!=ii
                Temp3=1;
                for kk=1:nn
                    if and(kk!=ii,kk!=jj)
                        Temp3=Temp3*((xx-Xi(kk))*(xx-Xi(kk))) ...
                        /((Xi(ii)-Xi(kk))*(Xi(ii)-Xi(kk)));
                    endif
                endfor
                Temp2=Temp2+Temp3* ...
                (xx-Xi(jj))/((Xi(ii)-Xi(jj))*(Xi(ii)-Xi(jj)));
            endif
        endfor
        Temp2=Temp2*2;
        
        fi(2*ii-1)=Temp1*Temp+(1+Temp*(xx-Xi(ii)))*Temp2;
        fi(2*ii)=Temp1+Temp2*(xx-Xi(ii));
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
