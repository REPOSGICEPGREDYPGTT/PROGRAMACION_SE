tic
Ybus=[4 -2 1 ; 20 -7 12 ; -8 13 17];
[fil,col]=size(Ybus);
for m=1:fil
    inversa=Ybus;
    %Paso uno.
    pivote=Ybus(m,m);
    aux=-1/Ybus(m,m);
    %Paso dos.
    for j=1:fil
        for k=1:col
            if j~=m && k~=m
           Ybus(j,k)=inversa (j,k)-(inversa(j,m)*inversa(m,k)/inversa(m,m));
            elseif j==m || k==m
           Ybus(j,k)=inversa(j,k)*aux;       
            end
        end   
    end
    Ybus(m,m)=aux;
end
inv=-Ybus;

disp(inv)
toc