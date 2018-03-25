function KKK=CalcLinear1DnqDOF(Q,LengthX,nn,qq,Alpha)
%This function evaluae the Element Stiffness Matrix
% for a THIN BEAM element with:
%LengthX = length in the x-direction
%Q       = the beam bending stiffness EI
%          Since it ia scalar, 
%          you do not really nedd to include it
%nn      = number of nodes per element
%qq      = degree of continity of the elements
%The element has (nn*(qq+1)) DOF
%q+1 DOF per node 
%Alpha   = the derivative used to evaluate the matrix 
%          This will allow you to use the same function 
%          to evaluate any matrix for the element
%          For example, if you use Alpha=0 you will get
%          the mass matrix, while Alpha=1 will give you
%          the geometric stiffness matrix, etc ...


%This function uses Gauss-Lagrange NUMERICAL INTEGRATION
% we used 12 evaluation points which is
% accurate up to 24th order polynomials
% this maybe OVERKILLING in many cases
GCPoints=nn*(qq+1)-1;
if GCPoints<2
  GCPoints=2;
elseif GCPoints>12
  GCPoints=12;
endif
  
GaussConstants=GetGC(GCPoints);
%*************************************
%Initializing stiffness matrix 
KB=zeros(nn*(qq+1),nn*(qq+1));
%Getting the location of all nodes
Dxx=LengthX/(nn-1);
XX=0:Dxx:LengthX;
%Evaluating the transformation matrix for each node
Tk=CalcTk1D(XX,nn,qq);

%Start the numerical integrration procedure
      for Xi=1:GCPoints %looping over x-integration points
         %Evaluating physical x-coordinate
         X = LengthX * (GaussConstants(2, Xi) + 1) / 2;
            %**************************
            %Evaluating the vector used for the matrix
            % integration
            Gk=CalcGk1D(X,XX,nn,qq,Alpha);
            cb=[];
            for ii=1:nn 
                %Multiplying by the transformation matices
                % and putting everything in one vector 
                cb=[cb,Gk(:,ii)'*Tk(:,:,ii)];
            endfor 
            %**************************
            %Multiplying the C'.Q.C at the point
            Kb= cb'*Q*cb;
            %**************************
            %performing the weighted summation
            KB=KB+GaussConstants(1,Xi)*Kb;
            %End of Calculation loop body
      endfor 
      %Multiplying the resulting matreces by Jacobian
      KKK = KB * LengthX  / 2;

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