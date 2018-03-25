%This program will evaluate the stiffness matrix 
% for a SINGLE beam 2-D bending element
% using Thin Beam Theory
% 

    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682

    
%Clearing everything
clear all
clc
close all 
tic
%Problem Data
qq=1; %Element continuity C^qq 
Nne=12; %Number of nodes per element of the beam
nn=Nne*2-1; %Plynomial degree

Lx=1; %Length in the x-direction
E=12; %modulus of elasticity
Thickness=1; %Beam thickness
Width=1; %Beam width

%Evaluating the beam stiffness
Q=E*Width*Thickness*Thickness*Thickness/12; %EI
%Evaluating the Transformation matrix 
%T1=CalcTinv1D2DOF(Lx,nn);
%Evaluating the element stiffness matrix 
%KB=CalcLinear1D2DOF(Q,Lx,nn);
%KB=CalcLinearExact1D2DOF(Q,Lx,nn);
%%%%%%%%%KB=CalcLinearLaplace1D2DOF(Q,Lx,Nne);
%Transforming from generalized coordinates
% into DOF generalized coordinates
%KB=T1'*KB*T1;
KB=CalcLinear1DnqDOF(Q,Lx,Nne,qq,2);
KB;
vvB=sort((real(eig(KB))));
vvB(1:4)
%You may check that the Eigenvalues of the 
% stiffness matrix will have  
% two (almost) zeros at the beginning
% followed by positive numbers
% UP TO 7 nodes (14 DOF)
% after that, the results of the program 
% become INVALID!!!
%Using the Modified Lagrange Polynomials
% the program produced valid results
% were valid uo to 12 nodes per element (24 DOF)
% which is the limit of the 12 point numerical
% integration scheme used
%Using the exact integration, 
% the results improved one degree
% compared to the classical method
% the scheme failed after 8 nodes per element (16 DOF)
toc