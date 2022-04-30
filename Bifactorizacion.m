
Ybus=[4 -2 1 ; 20 -7 12 ; -8 13 17];
Ibus=[1 ; 2 ; 3];
[fil,col]=size(Ybus);
for m=1:fil
   cont=0;
   pivote=Ybus(m,m);
   Ybus(m,m)=1;
   %Opero los elementos a la derecha del pivote.
   for j=m:fil
   for k=m+1:col
      if j==m
      Ybus(m,k)=Ybus(m,k)/pivote;
      cont=cont+1;
      else
      Ybus(j,k)=Ybus(j,k)-(Ybus(j,m)*Ybus(m,k));    
      end
   end
   end
end
disp(Ybus)