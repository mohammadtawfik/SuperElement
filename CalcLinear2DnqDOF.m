function KKK=CalcLinear2DnqDOF(Q,LengthX,LengthY,nn,qq,Alpha)
%This function evaluae the Element Stiffness Matrix
% for a THIN BEAM element with:
%LengthX = length in the x-direction
%Q       = the beam bending stiffness EI
%nn      = number of nodes per element
%qq      = degree of continity of the elements
%The element has (nn*(qq+1)) DOF
%q+1 DOF per node 
%Alpha = the number of derivatives used to evaluate
% the element matrix ... 
% for the plate, this will be always 2


%NOTE: Code can be easily modified to include 
% OTHER element MATRICES by adding simple lines in the
% evaluation loops as indicated below.

%This function uses Gauss-Lagrange NUMERICAL INTEGRATION
% we used 12 evaluation points which is
% accurate up to 24th order polynomials
% this maybe OVERKILLING in many cases
GaussConstants=zeros(2,12);
%Evaluation points
GaussConstants(2, 1) = -0.9815606342;
GaussConstants(2, 2) = -0.9041172564;
GaussConstants(2, 3) = -0.7699026742;
GaussConstants(2, 4) = -0.5873179543;
GaussConstants(2, 5) = -0.3678314990;
GaussConstants(2, 6) = -0.1252334085;
GaussConstants(2, 7) = -0.1252334085;
GaussConstants(2, 8) = 0.3678314990;
GaussConstants(2, 9) = 0.5873179543;
GaussConstants(2, 10) = 0.7699026742;
GaussConstants(2, 11) = 0.9041172564;
GaussConstants(2, 12) = 0.9815606342;
%Corresponding wights
GaussConstants(1, 1) = 0.0471753363;
GaussConstants(1, 2) = 0.1069393260;
GaussConstants(1, 3) = 0.1600783285;
GaussConstants(1, 4) = 0.2031674267;
GaussConstants(1, 5) = 0.2334925365;
GaussConstants(1, 6) = 0.2491470458;
GaussConstants(1, 7) = 0.2491470458;
GaussConstants(1, 8) = 0.2334925365;
GaussConstants(1, 9) = 0.2031674267;
GaussConstants(1, 10) = 0.1600783285;
GaussConstants(1, 11) = 0.1069393260;
GaussConstants(1, 12) = 0.0471753363;
%*************************************
%Initializing stiffness matrix 
KB=zeros(nn*(qq+1)*nn*(qq+1),nn*(qq+1)*nn*(qq+1));
%If you want ot evaluate more matrices
% DO NOT FORGET to initialize them here

%Creating vectors of nodes' coordinates
Dxx=LengthX/(nn-1);
XX=0:Dxx:LengthX;
Dyy=LengthY/(nn-1);
YY=0:Dyy:LengthY;
%Evaluating the nodes' transformation matrices
Tkx=CalcTk1D(XX,nn,qq);
Tky=CalcTk1D(YY,nn,qq);

%Start the numerical integrration procedure
for Yi=1:12 %looping over y-integration points
   %Evaluating physical y-coordinate
   Y = LengthY * (GaussConstants(2, Yi) + 1) / 2;
      %Getting the interpolation polynomials
      % and the first two derivatives
      Gy=CalcGk1D(Y,YY,nn,qq,0);
      Gky=CalcGk1D(Y,YY,nn,qq,1);
      Gkyy=CalcGk1D(Y,YY,nn,qq,2);
      cy=[];
      cby=[];
      cbyy=[];
      %Creating the N, Ny and Nyy vectors
      for ii=1:nn 
          cy=[cy,Gy(:,ii)'*Tky(:,:,ii)];
          cby=[cby,Gky(:,ii)'*Tky(:,:,ii)];
          cbyy=[cbyy,Gkyy(:,ii)'*Tky(:,:,ii)];
      endfor 
      for Xi=1:12 %looping over x-integration points
         %Evaluating physical x-coordinate
         X = LengthX * (GaussConstants(2, Xi) + 1) / 2;
         %**************************
         %Getting the interpolation polynomials
         % and the first two derivatives
         Gx=CalcGk1D(X,XX,nn,qq,0);
         Gkx=CalcGk1D(X,XX,nn,qq,1);
         Gkxx=CalcGk1D(X,XX,nn,qq,2);
         cx=[];
         cbx=[];
         cbxx=[];
         %Creating the N, Nx and Nxx vectors
         for ii=1:nn 
             cx=[cx,Gx(:,ii)'*Tkx(:,:,ii)];
             cbx=[cbx,Gkx(:,ii)'*Tkx(:,:,ii)];
             cbxx=[cbxx,Gkxx(:,ii)'*Tkx(:,:,ii)];
         endfor 
         %Getting the CB matrix=[Nxx;Nyy;Nxy
         CB=[NxyMult(cbxx,cy,nn,qq)';NxyMult(cx,cbyy,nn,qq)';NxyMult(cbx,cby,nn,qq)'];
            
         %**************************
         %Multiplying the C'.Q.C at the point
         Kb= CB'*Q*CB;
         %For mass matrix use the line below
         %NOTE that the density is
         % NOT included in this function
         %Mb= NxyMult(cx,cy,nn,qq)'*Rho*NxyMult(cx,cy,nn,qq);
         %**************************
         %performing the weighted summation
         KB=KB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*Kb;
         %For mass matrix use the line below
         %MB=MB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*Mb;
         %End of Calculation loop body
         endfor
      endfor 
      %Multiplying the resulting matreces by Jacobian
      KKK = KB * LengthX *LengthY / 4;
      %Do the same for all matrices you calculate
      % in this function before returning
      %If you use this function for other matrices
      % DO NOT FORGET
      % to ADD them in the return arguments of the function

      %For details and explanation about this
      %Numerical Integration Routine
      %Refer to the lecture notes published on 
      % ResearchGate.Net
      % Title: Finite Element Analysis by Mohammad Tawfik
      % DOI: 10.13140/RG.2.2.32391.70560
  

    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682