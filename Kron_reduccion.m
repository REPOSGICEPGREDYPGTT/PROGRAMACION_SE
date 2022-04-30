Y_bus=[2 1 13 ; 4 1 57 ; 7 1 89];
I_bus=[17 ; 45 ; 70];

[fil,col]=size(Y_bus);

for m=1:(fil-1)
    pivote=Y_bus(m,m);
    
    %Paso uno.
%     for j=m+1:col
%         Y_bus(m,j)=Y_bus(m,j)/pivote;
%     end
    Y_bus(m,m+1:col)=Y_bus(m,m+1:col)./pivote;
    
    %Paso dos.
    I_bus(m,1)=I_bus(m,1)/pivote;
    
    %Paso tres.
    Y_bus(m,m)=1;
    
    %Paso cuatro.
    for j=m+1:fil
        for k=m+1:col
        Y_bus(j,k)=Y_bus(j,k)-(Y_bus(j,m)*Y_bus(m,k));    
        end
    end
    
    %Paso cinco.
    for j=m+1:fil
        I_bus(j,1)=I_bus(j,1)-(Y_bus(j,m)*I_bus(m,1));
    end
    
    %Paso seis.
    Y_bus(m+1:col,m)=zeros(col-m,1);
end
