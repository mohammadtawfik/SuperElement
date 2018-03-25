%This program will evaluate the stiffness matrix 
% for a SINGLE bar 1-D element


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

%Problem Data
Nne=2; %Number of nodes per element of the beam
nn=Nne-1; %Plynomial degree

Lx=1; %Length in the x-direction
E=1; %modulus of elasticity
Thickness=1; %Beam thickness
Width=1; %Beam width

%Evaluating the plate stiffness matrix 
Q=E*Width*Thickness; %EA
%Evaluating the Transformation matrix 
T1=CalcTinv1D1DOF(Lx,nn);
%Evaluating the element stiffness matrix 
% Using classical method 
KB=CalcLinear1D1DOF(Q,Lx,nn);
% Using Exact method 
%KB=CalcLinearExact1D1DOF(Q,Lx,nn);
% Using Lagrange polynomials
%KB=CalcLinearLagrange1D1DOF(Q,Lx,nn);

%Transforming from generalized coordinates
% into DOF generalized coordinates
% IMPORTANT: Do not use with Lagrange method 
KB=T1'*KB*T1;

vvB=sort((real(eig(KB))));
vvB
%You may check that the Eigenvalues of the 
% stiffness matrix will have  
% ALL-but-one (almost) zeros at the beginning
% UP TO 16 nodes 
% after that, the results of the program 
% become INVALID as you start getting significant
% NEGATIVE eigenvalues!!!
%Using Lagrange polynomials
% the program failed after 24 DOF!!!
% which is th limit of accuracy of the
% numerical integration scheme used
%Using the exact integration,
% the element failed after 14 nodes
% which indicates the inntroduction of
% other errors in the matrix evaluation process