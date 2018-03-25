function Tk=CalcTk1D(Xi,nn,qq)
  %This function will evaluatethe 
  % transfomation matrix at each node
  % an element with nn nodes
  % qq continuity and nodes at Xi
  
    %Initializing the matrices
    Tk=zeros(qq+1,qq+1,nn);
    for ii=1:nn 
        for Alpha=0:qq 
            xx=Xi(ii);
            %Evaluating the Gk(x) ate each node
            Gk=CalcGk1D(xx,Xi,nn,qq,Alpha);
            Tk(Alpha+1,:,ii)=(Gk(:,ii)');
        endfor
        %Inverting the matrices
        Tk(:,:,ii)=inv(Tk(:,:,ii));
    endfor
endfunction

    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682