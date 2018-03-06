function Cb=CalcCb(xx,yy,nn)
    %This function evaluates the
    % PLATE CURVATURES
    % at the point xx,yy
    %The plate has (nn+1) DEGREES OF FREEDOM
    % in EACH DIRECTION and uses n ORDER POLYNOMIAL
    %This matrix is derived from the 
    % THIN PLATE theory
    C1=CalcHwxx(xx,yy,nn); %Curvature in the x-direction
    C2=CalcHwyy(xx,yy,nn); %Curvature in the y-direction
    C3=2*CalcHwxy(xx,yy,nn); %Cross curvature
    Cb=-[C1';C2';C3']; 
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682