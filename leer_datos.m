function [datos_1,datos_2]=leer_datos(archivo)

fid=fopen(archivo,'r');
line=fgetl(fid);

%Leer matriz uno.
nbar=str2num(line(40));
barra=zeros(nbar,1);
tipo=zeros(nbar,1);
V_desead=zeros(nbar,1);
theta_V=zeros(nbar,1);
P_load=zeros(nbar,1);
Q_load=zeros(nbar,1);
P_gen=zeros(nbar,1);
Q_gen=zeros(nbar,1);

for i=1:nbar
line=fgetl(fid);
barra(i,1)=str2num(line(4));
tipo(i,1)=str2num(line(14));
V_desead(i,1)=str2num(line(17:24));
theta_V(i,1)=str2num(line(25:33));
P_load(i,1)=str2num(line(34:42));
Q_load(i,1)=str2num(line(43:50));
P_gen(i,1)=str2num(line(51:57));
Q_gen(i,1)=str2num(line(59:64));
end
datos_1=[barra tipo V_desead theta_V P_load Q_load P_gen Q_gen];

%_____________________MATRIZ DE DATOS NUMERO DOS___________________________

%Leer matriz dos.

limite=fgetl(fid); %Para que continue leyendo y se salte la fila que esta vacia
line=fgetl(fid);
ncon=str2num(line(40:41));

from=zeros(ncon,1);
to=zeros(ncon,1);
R=zeros(ncon,1);
X=zeros(ncon,1);
B=zeros(ncon,1);
MVA_rating=zeros(ncon,1);
TAP=zeros(ncon,1);
angle_TRF=zeros(ncon,1);

for j=1:ncon
line=fgetl(fid);
from(j,1)=str2num(line(1:4));
to(j,1)=str2num(line(6:9));
R(j,1)=str2num(line(15:22));
X(j,1)=str2num(line(25:32));
B(j,1)=str2num(line(36:43));
MVA_rating(j,1)=str2num(line(45:48));
TAP(j,1)=str2num(line(50:54));
angle_TRF(j,1)=str2num(line(56:60));
end
datos_2=[from to R X B MVA_rating TAP angle_TRF];
fclose(fid);
end