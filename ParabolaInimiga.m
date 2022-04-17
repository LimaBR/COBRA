clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
t = linspace(-5, 5, amostras);



randomz=0.01*randn(1,amostras);
randomx=0.01*randn(1,amostras);
randomy=0.1*randn(1,amostras);
random_other=randn(1,amostras);

%ponto de origem do inimigo
x0=random_other(3);
y0=random_other(4);
z0=random_other(5);

a=-50*abs(randomz(1));
b=10*random_other(2);

azimute=pi*random_other(6);
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

x=t.*cos(azimute)+x0;
y=t.*sin(azimute)+y0;

% for n=1:1:amostras
%     x1(n)=x(n)+randomx(n);
% 
% end
% 
% for n=1:1:amostras
%     y1(n)=y(n)+randomy(n);
% 
% end

z = a*(x.^2+y.^2)+b+z0;


distancia_medida=sqrt(z.^2+x.^2+y.^2);

azimute_medido=atan2(y, x);

phi_medido=atan2(sqrt(x.^2 + y.^2), z)

plot3(x, y, z)

% for n=1:1:amostras
% 
%     z1(n)=z(n)+randomz(n);
% 
% end
%% Plotando os gráficos

 
% plot3(x1,y1,z1);
% axis equal
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')





%% COlocando ruido
%[Xi,Yi]=meshgrid(t,t);
%Zi=griddata(x1,y1,z1,Xi,Yi);
%mesh(Xi,Yi,Zi);
%plot3(x1,y1,Zi,'*');



for n=1:1:amostras
    distancia_medida1(n)=distancia_medida(n)+randomx(n);
 
end

for n=1:1:amostras
   azimute_medido1(n)=azimute_medido(n)+randomx(n);
 
end

for n=1:1:amostras
    phi_medido1(n)=phi_medido(n)+randomx(n);
 
 end


%%

out = [distancia_medida1; azimute_medido1; phi_medido1];
writematrix(out, 'LabVIEW\adp.csv');
