function Si=CalcSi1D(x,Xi,nn,qq)
    
    Aqi=CalcAqi(x,Xi,nn,qq);
    Bqi0=CalcBqi0(x,Xi,nn,qq);
    Bqi(1,:)=Bqi0;
    if qq>0
        Bqi0=CalcBqi1(x,Xi,nn,qq);
        Bqi(2,:)=Bqi0;
    endif
    if qq>1
        Bqi0=CalcBqi2(x,Xi,nn,qq);
        Bqi(3,:)=Bqi0;
    endif
    if qq>2
        Bqi0=CalcBqi3(x,Xi,nn,qq);
        Bqi(4,:)=Bqi0;
    endif
    if qq>3
        DeltaX=0.01*x;
        if DeltaX==0
            DeltaX=0.01;
        endif
        Bqi31=CalcBqi3(x+DeltaX,Xi,nn,qq);
        Bqi32=CalcBqi3(x-DeltaX,Xi,nn,qq);
        Bqi(5,:)=(Bqi31-Bqi32)/2/DeltaX;
    endif
    if qq>4
        DeltaX=0.01*x;
        if DeltaX==0
            DeltaX=0.01;
        endif
        Bqi30=CalcBqi3(x,Xi,nn,qq);
        Bqi31=CalcBqi3(x+DeltaX,Xi,nn,qq);
        Bqi32=CalcBqi3(x-DeltaX,Xi,nn,qq);
        Bqi(5,:)=(Bqi31-2*Bqi30+Bqi32)/DeltaX/DeltaX;
    endif
    if qq>5
        break;
    endif
    
    
        
    
    