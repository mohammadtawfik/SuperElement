function Aqi=CalcBqi0(x,Xi,nn,qq)
    %This function evaluates the B(x) function at all nodes
    %x  = x-position
    %Xi = coordinates of all nodes
    %nn = number of nodes
    %qq = elemenet continuity
    Aqi=zeros(nn,1);;
    for ii=1:nn
        Temp0=1;
        for jj=1:nn 
            if jj!=ii
                Temp0=Temp0*((x-Xi(jj))^(qq+1)) ...
                /((Xi(ii)-Xi(jj))^(qq+1));
            endif
        endfor
        Aqi(ii)=Temp0;
    endfor
endfunction                
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682