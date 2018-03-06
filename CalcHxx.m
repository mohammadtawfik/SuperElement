function fi=CalcHxx(xx,nn)
    %this function evaluates each term of 
    % a POLYNOMIAL SECOND DERIVATIVE
    % of DEGREE nn 
    % at the POINT xx
    fi(1)=0; fi(2)=0; fi(3)=2;
    for ii=4:nn+1
        fi(ii)=fi(ii-1)*xx*(ii-1)/(ii-3);
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
