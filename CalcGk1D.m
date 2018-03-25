function gk=CalcGk1D(x,Xi,nn,qq,Alpha)
  %This function evaluates the A(x) and B(x)
  % functions and their derivatives
  % up to Alpha derivative
  %qq= Element continuity
  %nn= number of nodes per element
    
    %Initializing the matrices
    Aqi=zeros(qq+1,nn,Alpha+1);
    Bqi=zeros(1,nn,Alpha+1);
    
    for ii=0:Alpha
        %Evaluating the ii th derivative
        % of the polynomial A(x) at each node
        Aqi(:,:,ii+1)=CalcAqi(x,Xi,nn,qq,ii);
    endfor
    %Evaluating the polynomial B(x) at each node
    Bqi(1,:,1)=CalcBqi0(x,Xi,nn,qq)';
    if Alpha>0
        %Evaluating the first derivative 
        % of the polynomial B(x) at each node
        Bqi(1,:,2)=CalcBqi1(x,Xi,nn,qq);
    endif
    if Alpha>1
        %Evaluating the second derivative 
        % of the polynomial B(x) at each node
        Bqi(1,:,3)=CalcBqi2(x,Xi,nn,qq);
    endif
    if Alpha>2
        %Evaluating the third derivative 
        % of the polynomial B(x) at each node
        Bqi(1,:,4)=CalcBqi3(x,Xi,nn,qq);
    endif
    if Alpha>3
        %Evaluating the fourth derivative 
        % of the polynomial B(x) at each node
        % using numerical differentiation
        DeltaX=0.01*x;
        if DeltaX==0
            DeltaX=0.01;
        endif
        Bqi31=CalcBqi3(x+DeltaX,Xi,nn,qq);
        Bqi32=CalcBqi3(x-DeltaX,Xi,nn,qq);
        Bqi(1,:,5)=(Bqi31-Bqi32)/2/DeltaX;
    endif
    if Alpha>4
        %Evaluating the fifth derivative 
        % of the polynomial B(x) at each node
        % using numerical differentiation
        DeltaX=0.01*x;
        if DeltaX==0
            DeltaX=0.01;
        endif
        Bqi30=CalcBqi3(x,Xi,nn,qq);
        Bqi31=CalcBqi3(x+DeltaX,Xi,nn,qq);
        Bqi32=CalcBqi3(x-DeltaX,Xi,nn,qq);
        Bqi(1,:,6)=(Bqi31-2*Bqi30+Bqi32)/DeltaX/DeltaX;
    endif
    if Alpha>5
        break;
    endif
    %Multiplyinh A(x) and B(x) to get G(x)
    gk=zeros(qq+1,nn);
    for ii=1:nn
        for kk=1:qq+1
            for Beta=0:Alpha
                gk(kk,ii)=gk(kk,ii)+ ...
                factorial(Alpha)/factorial(Alpha-Beta)/factorial(Beta)* ...
                Aqi(kk,ii,Alpha-Beta+1)*Bqi(1,ii,Beta+1);
            endfor
        endfor
    endfor
endfunction
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682