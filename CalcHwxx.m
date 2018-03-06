function Hw=CalcHwxx(xx,yy,nn)
    %this function evaluates each term of 
    % The SECOND X-Derivative of
    % TWO Dimensional Polynomial
    % of DEGREE nn in the x&y directions
    % at the POINT xx,yy    
    %********************************************
    fi=CalcHxx(xx,nn); %Evaluating the x-polynomial
    gj=CalcH(yy,nn); %Evaluating the y-polynomial
    Hw=FGMult(fi,gj,nn); %Multiplying the 1-D polynomials
    %********************************************
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682