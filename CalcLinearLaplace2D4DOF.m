function KKK=CalcLinearLaplace2D4DOF(Q,LengthX,LengthY,nn)
%This function evaluae the Element Stiffness Matrix
% for a THIN PLATE element with:
%LengthX = length in the x-direction
%LengthY = length in the y-direction
%Q       = the plate stiffness matrix 3x3
%nn      = Nummber of nodes per side of the plate
%2nn-1   = shape function degree in one direction
%The plate has 4nn^2 DOF
%4 DOF per node w,wx,wy,wxy

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
KB=zeros(4*nn*nn,4*nn*nn);
%If you want ot evaluate more matrices
% DO NOT FORGET to initialize them here

%Start the numerical integrration procedure
      for Xi=1:12 %looping over x-integration points
         %Evaluating physical x-coordinate
         X = LengthX * (GaussConstants(2, Xi) + 1) / 2;
         for Yi=1:12 %looping over y-integration points
            %Evaluating physical y-coordinate
            Y= LengthY * (GaussConstants(2,Yi) + 1) / 2;
            %**************************
            %Evaluating the C matrix at the (X,Y) pont
            cb=CalcCbLaplace(X,Y,nn,LengthX,LengthY);
            %To evaluate the mass matrix use the line below
            %Hb=CalcNw(X,Y,nn);
            %To evaluate the Geometric Stiffness
            % matrix use the line below
            %Gg=CalcNwx(X,Y,nn);
            %**************************
            %Multiplying the C'.Q.C at the point (X,Y)
            Kb= cb'*Q*cb;
            %For mass matrix use the line below
            %Mb= Hb*Hb';
            %For geometric stiffness matrix use line below
            %Gb= Gg*Gg';
            %**************************
            %performing the weighted summation
            KB=KB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*Kb;
            %For mass matrix use the line below
            %MB=MB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*Mb;
            %For geometric stiffness matrix use line below
            %GB=GB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*Gb;
            %End of Calculation loop body
         endfor
      endfor 
      %Multiplying the resulting matreces by Jacobian
      KKK = KB * LengthX * LengthY / 4;
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
    %DOI: 10.13140/RG.2.2.24039.75682