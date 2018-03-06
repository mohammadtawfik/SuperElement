function KKK=CalcLinearExact1D2DOF(Q,LengthX,nn)
%This function evaluae the Element Stiffness Matrix
% for a THIN BEAM element with:
%LengthX = length in the x-direction
%Q       = the beam bending stiffness EI
%nn      = shape function degree in one direction
%The beam has (nn+1) DOF
%2 DOF per node w,wx

%NOTE: Transformation matrix not included 
% in function arguments to provide more 
% flexibility in the modification of the code
% THUS, the returned values should be multiplied 
% by the transformation matrix.

%NOTE: Code can be easily modified to include 
% OTHER element MATRICES by adding simple lines in the
% evaluation loops as indicated below.

%Initializing stiffness matrix 
KB=zeros(nn+1,nn+1);
%If you want ot evaluate more matrices
% DO NOT FORGET to initialize them here

for ii=3:nn+1
    for jj=3:nn+1
        KB(ii,jj)=(LengthX^(ii+jj-5))* ...
        (ii-1)*(ii-2)*(jj-1)*(jj-2)/(ii+jj-5);
    endfor
endfor

%To evaluate the mass matrix include the line below
%for ii=1:nn+1
%    for jj=1:nn+1
%        MB(ii,jj)=(LengthX^(ii+jj-1))/(ii+jj-1);
%    endfor
%endfor

%To evaluate the geometric stiffness matrix 
% use the lines below
%for ii=2:nn+1
%    for jj=2:nn+1
%        GB(ii,jj)=(LengthX^(ii+jj-3))*(ii-1)*(jj-1)/(ii+jj-3);
%    endfor
%endfor

        
      KKK= KB;
      
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %DOI: 10.13140/RG.2.2.24039.75682