Ybus=[4 -2 1 ; 20 -7 12 ; -8 13 17 ];
Ibus=[1 ; 2 ; 3];
[fil,col]=size(Ybus);

L=zeros(fil,col);
U=eye(fil);

%Paso uno.
L(:,1)=Ybus(:,1);

%Paso dos.
U(1,:)=Ybus(1,:)./L(1,1);

for k=2:col
    %Paso tres
    for j=k:col
        aux=0;
        for m=1:k-1
            aux=aux+(L(j,m)*U(m,k));
        end
        L(j,k)=Ybus(j,k)-aux;
    end
    
    %Paso cuatro.
    for j=k+1:fil
        aux=0;
        for m=1:k-1
            aux=aux+(L(k,m)*U(m,j));
        end
        U(k,j)=(Ybus(k,j)-aux)/L(k,k);
    end
end

%Reduccion hacia adelante para encontrar D
D=zeros(fil,1);
L_aux=L;
for i=1:fil
    eq_1=sum(L_aux(i,:))-L_aux(i,i);
    eq_2=Ibus(i)-eq_1;
    si=L_aux(i,i); 
    D(i,1)=eq_2/si;
    L_aux(:,i)=L_aux(:,i).*D(i,1);
end

resp=zeros(fil,1);
U_aux=U;
for i=1:fil
    eq_1=sum(U_aux(fil-i+1,:))-U_aux(fil-i+1,fil-i+1);
    eq_2=D(fil-i+1,1)-eq_1;
    si=U_aux(fil-i+1,col-i+1); 
    resp(fil-i+1,1)=eq_2/si;
    U_aux(:,col-i+1)=U_aux(:,col-i+1).*resp(fil-i+1,1);
end
disp(resp)