%Nombrar el archivo desde el cual se va a leer.
archivo='datos.txt';

%Abrir el archivo de datos.
fid=fopen(archivo,'r');
%Leer la primera fila del archivo (nombres).
line=fgetl(fid);
%Inicializar la matriz dat (ahorra tiempo de computo).
dat=zeros(5,3);

%Leer la matriz dat fila a fila.
for i=1:5
line=fgetl(fid);
dat(i,1)=str2num(line(1:3));
dat(i,2)=str2num(line(10:13));
dat(i,3)=str2num(line(17:20));
end
%Cerrar el archivo desde el cual se esta leyendo.
fclose(fid);
%Inicializar la matriz Y (ahorra tiempo de computo).
Y=zeros(3,3);
%construir la matriz Ybus.
for i=1:5
%Llamar las vaiables.    
from=dat(i,1);
to=dat(i,2);
val=1/dat(i,3);

%Llenar los elementos de la diagonal.
if from~=0
 Y(from,from)=Y(from,from)+val;
end
%Llenar los elementos de la diagonal.   
if to~=0
 Y(to,to)=Y(to,to)+val;
end
%Llenar los elementos fuera de la diagonal.
if from~=0 && to~=0
 Y(to,from)= Y(to,from)-val;
 Y(from,to)= Y(from,to)-val;
end

end
%Mostrar la matriz Ybus.
disp('La Ybus del sistema es:')
disp(Y)