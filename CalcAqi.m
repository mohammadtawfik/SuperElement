function Aqi=CalcAqi(x,Xi,nn,qq,Alpha)
    %This function evaluates the Alpha th derivative
    % of the function A(x) function at all nodes
    %x  = x-position
    %Xi = coordinates of all nodes
    %nn = number of nodes
    %qq = elemenet continuity
    %Alpha = Derivative required
    Aqi=zeros(qq+1,nn);
    for ii=1:nn
            for kk=Alpha+1:qq+1
                Aqi(kk,ii)=factorial(kk-1) ...
                /factorial(kk-Alpha-1) ...
                *(x-Xi(ii))^(kk-Alpha-1);
            endfor
    endfor
endfunction                
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682