function Hw=CalcNwyy(xx,yy,nn,Lx,Ly)
    %this function evaluates each term of 
    % SECOND derivative in the y-direction of 
    % TWO Dimensional Polynomial
    % of nn NODES in the x&y directions
    % at the POINT xx,yy
    %The Polynomial used is the Modifies Lagrange
    % Polynomial described in the paper mentioned below
    %********************************************
    fi=CalcN(xx,nn,Lx); %Evaluating the x-polynomial
    gj=CalcNxx(yy,nn,Ly); %Evaluating the y-curvature
    Hw=PolyMult(fi,gj,nn); %Multiplying the 1-D polynomials
    %********************************************
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682