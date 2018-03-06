function Cb=CalcCbLaplace(xx,yy,nn,Lx,Ly)
    %This function evaluates the
    % PLATE CURVATURES
    % at the point xx,yy
    %The plate has nn NODES PER SIDE
    % in EACH DIRECTION and uses 2n+1 ORDER POLYNOMIALS
    %This matrix is derived from the 
    % THIN PLATE theory
    C1=CalcNwxx(xx,yy,nn,Lx,Ly); %Curvature in the x-direction
    C2=CalcNwyy(xx,yy,nn,Lx,Ly); %Curvature in the y-direction
    C3=2*CalcNwxy(xx,yy,nn,Lx,Ly); %Cross curvature
    Cb=-[C1';C2';C3']; 
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682    