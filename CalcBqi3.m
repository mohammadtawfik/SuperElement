function Aqi=CalcBqi3(x,Xi,nn,qq)
    %This function evaluates the third derivativs
    % of B(x) function at all nodes
    %x  = x-position
    %Xi = coordinates of all nodes
    %nn = number of nodes
    %qq = elemenet continuity
    Aqi=zeros(nn,1);
    for ii=1:nn
        Temp1=0;
        for ll=1:nn             
            if ll!=ii
                Temp0=1;
                for jj=1:nn 
                    if and(jj!=ii,jj!=ll)
                        Temp0=Temp0*((x-Xi(jj))^(qq+1)) ...
                        /((Xi(ii)-Xi(jj))^(qq+1));
                    endif
                endfor
                if and(qq!=0,qq!=1)
                  Temp1=Temp1+Temp0*(qq+1)*qq*(qq-1)*((x-Xi(ll))^(qq-2))/ ...
                  ((Xi(ii)-Xi(ll))^(qq+1));
                endif
            endif            
        endfor
        Temp2=0;
        for ll=1:nn
            if ll!=ii
                Temp21=0;
                for mm=1:nn
                  if and(mm!=ii,mm!=ll)
                    Temp0=1;
                    for jj=1:nn
                      if and(jj!=mm,and(jj!=ii,jj!=ll))
                        Temp0=Temp0*((x-Xi(jj))^(qq+1)) ...
                        /((Xi(ii)-Xi(jj))^(qq+1));
                      endif
                    endfor
                    Temp21=Temp21+Temp0*(qq+1)*((x-Xi(mm))^qq)/ ...
                    ((Xi(ii)-Xi(mm))^(qq+1));
                  endif            
                endfor
                if qq!=0
                  Temp2=Temp2+2*Temp21*(qq+1)*qq*((x-Xi(ll))^(qq-1))/ ...
                  ((Xi(ii)-Xi(ll))^(qq+1));
                endif
            endif
        endfor
        Temp3=0;
        for ll=1:nn
            if ll!=ii
                Temp31=0;
                for mm=1:nn
                  if and(mm!=ii,mm!=ll)
                    Temp0=1;
                    for jj=1:nn
                      if and(jj!=mm,and(jj!=ii,jj!=ll))
                        Temp0=Temp0*((x-Xi(jj))^(qq+1)) ...
                        /((Xi(ii)-Xi(jj))^(qq+1));
                      endif
                    endfor
                    if qq!=0
                      Temp31=Temp31+Temp0*(qq+1)*qq*((x-Xi(mm))^(qq-1))/ ...
                      ((Xi(ii)-Xi(mm))^(qq+1));
                    endif
                  endif            
                endfor
                Temp3=Temp3+Temp31*(qq+1)*((x-Xi(ll))^(qq))/ ...
                ((Xi(ii)-Xi(ll))^(qq+1));
            endif
        endfor
        Temp4=0;
        for ll=1:nn
            if ll!=ii
                Temp41=0;
                for mm=1:nn 
                    if and(mm!=ll,mm!=ii)
                        Temp42=0;
                        for pp=1:nn 
                            if and(pp!=mm,and(pp!=ll,pp!=ii))
                                Temp0=1;
                                for jj=1:nn 
                                    if and(and(jj!=pp,jj!=mm))
                                        if and(jj!=ll,jj!=ii)
                                            Temp0=Temp0*((x-Xi(jj))^(qq+1))/ ...
                                            ((Xi(ii)-Xi(jj))^(qq+1));
                                        endif 
                                    endif
                                endfor
                                Temp42=Temp42+Temp0*(qq+1)*((x-Xi(pp))^(qq))/ ...
                                ((Xi(ii)-Xi(pp))^(qq+1));
                            endif
                        endfor
                        Temp41=Temp41+Temp42*(qq+1)*((x-Xi(mm))^(qq))/ ...
                        ((Xi(ii)-Xi(mm))^(qq+1));
                    endif
                endfor
                Temp4=Temp4+Temp41*(qq+1)*((x-Xi(ll))^(qq))/ ...
                ((Xi(ii)-Xi(ll))^(qq+1));
            endif
        endfor            
        Aqi(ii)=Temp1+Temp2+Temp3+Temp4;
    endfor
endfunction                
    %Function will work on Octave, FreeMat, and Matlab
    %Create by Mohammad Tawfik
    %mohammad.tawfik@gmail.com 
    %In assotiation with research paper published on 
    %ResearchGate.Net
    %Title: In Search for the Super Element: Algorithms to Generate Higher-Order Elements
    %DOI: 10.13140/RG.2.2.24039.75682