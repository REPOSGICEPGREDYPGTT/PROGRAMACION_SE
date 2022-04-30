Y_bus=[-1 3 2 ; 2 -5 1 ; 3 1 -6];
I_bus=[12 ; -10 ; 4];

%Hago la matriz aumentada. 
Y_aum=[Y_bus , I_bus];
[fil,col]=size(Y_aum);
for i=1:(fil-1)
pivote=Y_aum(i,:);
for j=i+1:fil
pivote_prim=pivote*(Y_aum(j,i)/Y_aum(i,i));
temp=pivote_prim-Y_aum(j,:);
Y_aum(j,:)=temp;
end

end

%Comienzo la elimiacion hacia atras.
resp=zeros(fil,1);
col=col-1;
for i=1:fil
    eq_1=sum(Y_aum(fil-i+1,:))-Y_aum(fil-i+1,col-i+1)-Y_aum(fil-i+1,col+1);
    eq_2=Y_aum(fil-i+1,col+1)-eq_1; %col+1 porque la matriz es aumentada.
    si=Y_aum(fil-i+1,col-i+1); 
    resp(fil-i+1,1)=eq_2/si;
    Y_aum(:,col-i+1)=Y_aum(:,col-i+1).*resp(fil-i+1,1);
end




