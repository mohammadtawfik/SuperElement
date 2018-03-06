function fi=CalcH(xx,nn)
    %this function evaluates each term of 
    % a POLYNOMIAL
    % of DEGREE nn 
    % at the POINT xx
    fi=zeros(nn+1,1);
    fi(1)=1;
    for ii=2:nn+1
        fi(ii)=fi(ii-1)*xx;
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682
