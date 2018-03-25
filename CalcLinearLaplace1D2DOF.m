function KKK=CalcLinearLaplace1D2DOF(Q,LengthX,nn)
%This function evaluates the Element Stiffness Matrix
% for a THIN BEAM element with:
%LengthX = length in the x-direction
%Q       = the plate stiffness matrix 3x3
%nn      = Nummber of nodes
%2nn-1   = shape function degree in one direction
%The beam has 2nn DOF
%2 DOF per node w,wx

%NOTE: Code can be easily modified to include 
% OTHER element MATRICES by adding simple lines in the
% evaluation loops as indicated below.

%This function uses Gauss-Lagrange NUMERICAL INTEGRATION
% we used 12 evaluation points which is
% accurate up to 24th order polynomials
% this maybe OVERKILLING in many cases
GCPoints=nn;
if GCPoints<2
  GCPoints=2;
elseif GCPoints>12
  GCPoints=12;
endif
  
GaussConstants=GetGC(GCPoints);
%*************************************
%Initializing stiffness matrix 
KB=zeros(2*nn,2*nn);
%If you want ot evaluate more matrices
% DO NOT FORGET to initialize them here

%Start the numerical integrration procedure
      for Xi=1:GCPoints %looping over x-integration points
         %Evaluating physical x-coordinate
         X = LengthX * (GaussConstants(2, Xi) + 1) / 2;
            %**************************
            %Evaluating the C matrix at the X point
            cb=CalcNxx(X,nn,LengthX);
            %To evaluate the mass matrix use the line below
            %Hb=CalcN(X,nn);
            %To evaluate the Geometric Stiffness
            % matrix use the line below
            %Gg=CalcNx(X,nn);
            %**************************
            %Multiplying the C'.Q.C at the point X
            Kb= cb*Q*cb';
            %For mass matrix use the line below
            %Mb= Hb*Hb';
            %For geometric stiffness matrix use line below
            %Gb= Gg*Gg';
            %**************************
            %performing the weighted summation
            KB=KB+GaussConstants(1,Xi)*Kb;
            %For mass matrix use the line below
            %MB=MB+GaussConstants(1,Xi)*Mb;
            %For geometric stiffness matrix use line below
            %GB=GB+GaussConstants(1,Xi)*Gb;
            %End of Calculation loop body
      endfor 
      %Multiplying the resulting matreces by Jacobian
      KKK = KB * LengthX / 2;
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