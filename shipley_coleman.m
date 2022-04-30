tic
Ybus=[4 -2 1 ; 20 -7 12 ; -8 13 17];
[fil,col]=size(Ybus);
for m=1:fil
    %Paso uno.
    pivote=Ybus(m,m);
    %Paso dos.
    for j=1:fil
        for k=1:col
            if j~=m && k~=m
           Ybus(j,k)=Ybus(j,k)-(Ybus(j,m)*Ybus(m,k)/Ybus(m,m)); 
            end
        end   
    end
    %paso tres
    Ybus(m,m)=-1/Ybus(m,m);
    aux=Ybus(m,m);
    %paso cuatro
    Ybus(:,m)=Ybus(:,m).*aux;
    Ybus(m,:)=Ybus(m,:).*aux;
    Ybus(m,m)=aux;
end
inv=-Ybus;

disp(inv)
toc