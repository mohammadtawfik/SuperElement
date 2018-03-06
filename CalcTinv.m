function T1=CalcTinv(Lx,Ly,nn);
    %This function evaluates the INVERSE
    % of the transformation matrix 
    % transforming from the GENRAL CONSTANT
    % generalized coordinates to the 
    % DOF generalized coordinates for 
    % a thin plate with lengths Lx and Ly in the 
    % x & y direction respectively
    %nn stands for the degree of the polynomial in 
    % each direction
    %nn+1 stands for the number of generalized coordinates
    %The plate has (nn+1)^2 Degrees of freedom
    %4DOF per node w,wx,wy,wxy
    DD=(nn-1)/2; %Number of intervals (Nodes-1) in each direction
    Dx=Lx/DD; %Interval length in x-direction
    Dy=Ly/DD; %Interval length in y-direction
    Tb=zeros((nn+1)*(nn+1),(nn+1)*(nn+1));
    %The coming two loops pass by every node
    % and force the intepolation polynomial to 
    % be equal to the degrees of freedom at that node
    for jj=0:DD
        yy=jj*Dy; %Node y-coordinate
        for ii=0:DD 
            xx=ii*Dx; %Node x-coordinate
            NN=jj*(DD+1)+ii+1; %Node number
            Tb(4*(NN-1)+1,:)=CalcHw(xx,yy,nn);  %w
            Tb(4*(NN-1)+2,:)=CalcHwx(xx,yy,nn); %wx
            Tb(4*(NN-1)+3,:)=CalcHwy(xx,yy,nn); %wy
            Tb(4*(NN-1)+4,:)=CalcHwxy(xx,yy,nn);%wxy
        endfor
    endfor
    T1=inv(Tb);
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682