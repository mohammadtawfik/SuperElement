function Hw=FGMult(fi,gj,nn)
    %This function evaluates each term 
    % of a 2-D polynomial by multiplying
    % the terms of the respective polynomials
    % at point xx,yy
    %Each polynomial is of DEGREE nn 
    Hw=zeros((nn+1)*(nn+1),1);
    for ii=1:nn+1
        for jj=1:nn+1
            Hw((jj-1)*(nn+1)+ii)=fi(ii)*gj(jj);
        endfor
    endfor
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682