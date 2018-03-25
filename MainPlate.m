%This program will evaluate the stiffness matrix 
% for a SINGLE RECTANGULAR plate bending element
% using Thin Plate Theory

    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682
tic
    
%Clearing everything
clear all
clc
close all 

%Problem Data
qq=1; %Degree of elements' continuity
Nne=8; %Number of nodes per side of the plate
nn=Nne*2-1; %Plynomial degree in each direction

Lx=1; %Length in the x-direction
Ly=1; %Length in the y-direction
E=10.92; %modulus of elasticity
Nu=0.3; %Poisson's ratio
Thickness=1; %Plate thickness

%Evaluating the plate stiffness matrix 
Q=Thickness*Thickness*Thickness/12* ...
   [   E/(1-Nu*Nu),Nu*E/(1-Nu*Nu), 0 ; ...
    Nu*E/(1-Nu*Nu),   E/(1-Nu*Nu), 0 ; ...
    0             ,0             , 2*E/2/(1+Nu)];
%Evaluating the element stiffness matrix
% USING Classical Method C1 continuity
%KB=CalcLinear2D4DOF(Q,Lx,Ly,nn);
% USING Exact integration Method
%KB=CalcLinearExact2D4DOF(Q,Lx,Ly,nn);
%Both the above methods need the tansformation matrix
%Evaluating the Transformation matrix 
%T1=CalcTinv(Lx,Ly,nn);
%Transforming from generalized coordinates
% into DOF generalized coordinates
%KB=T1'*KB*T1;

% USING Modified Lagrange Polynomials C1 continuity
%KB=CalcLinearLaplace2D4DOF(Q,Lx,Ly,Nne);

% USING Modified Lagrange Polynomials "Cq" continuity
KB=CalcLinear2DnqDOF(Q,Lx,Ly,Nne,qq);

vvB=sort((real(eig(KB))));
vvB(1:4)

%You may check that the Eigenvalues of the 
% stiffness matrix will have  
% three (almost) zeros at the beginning
% followed by positive numbers
% UP TO 4 nodes per side (64 DOF)
% after that, the results of the program 
% become INVALID!!!
%Using Modifyed Lagrange Polynomials
% will work up to 10 nodes per side (400 DOF)
% after that, the negative eigenvalues become
% significant anf the program INVALID!!!
%Using the EXACT integration procedure
% the results fail when the number of nodes
% become more than 64 (like the classical method)
% indicating that the failure is a result of the 
% transformation matrix 
%Using the general derivative elements
% we reached 900 DOF (36 nodes * 25 DOF per node) 
% then stopped from further trials
toc