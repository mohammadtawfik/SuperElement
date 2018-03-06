function T1=CalcTinv1D2DOF(Lx,nn);
    %This function evaluates the INVERSE
    % of the transformation matrix 
    % transforming from the GENRAL CONSTANT
    % generalized coordinates to the 
    % DOF generalized coordinates for 
    % a thin beam with lengths Lx 
    %nn stands for the degree of the polynomial
    %nn+1 stands for the number of generalized coordinates
    %The beam has (nn+1) Degrees of freedom
    %2DOF per node w,wx
    DD=(nn-1)/2; %Number of intervals (Nodes-1)
    Dx=Lx/DD; %Interval length in x-direction
    Tb=zeros((nn+1),(nn+1));
    %The coming loop passes by every node
    % and force the intepolation polynomial to 
    % be equal to the degrees of freedom at that node
    for ii=0:DD 
        xx=ii*Dx; %Node x-coordinate
        NN=ii+1; %Node number
        Tb(2*(NN-1)+1,:)=CalcH(xx,nn);  %w
        Tb(2*(NN-1)+2,:)=CalcHx(xx,nn); %wx
    endfor
    T1=inv(Tb);
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682