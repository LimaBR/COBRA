clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
t = linspace(-1, 1, amostras);


%elevaçao
randomz=0.05*randn(1,amostras);
%distancia
randomx=0.005*randn(1,amostras);
%azimute
randomy=0.0009*randn(1,amostras);

random_other=randn(1,amostras);

%ponto de origem do inimigo
x0=random_other(3);
y0=random_other(4);
z0=abs(5*random_other(5));

a=-1*abs(random_other(1));
b=10*abs(random_other(2));

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

%subplot(2,1,1)
plot3(x, y, z)

out1 = [x; y; z];
writematrix(out1, 'LabVIEW\Main Folder\adpteste.csv');

grid on
xlabel('x')
ylabel('y')
zlabel('z')

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



%distancia
for n=1:1:amostras
    distancia_medida1(n)=distancia_medida(n)+randomx(n);
 
end

%azimute 
for n=1:1:amostras
   azimute_medido1(n)=azimute_medido(n)+randomy(n);
 
end

%elevaçao
for n=1:1:amostras
    phi_medido1(n)=phi_medido(n)+randomz(n);
 
end

 zfinal=phi_medido1.*distancia_medida1;

%%

out = [distancia_medida1; azimute_medido1; phi_medido1];
writematrix(out, 'LabVIEW\Main Folder\adp.csv');

%subplot(2,1,2)
%plot3(distancia_medida,azimute_medido1,phi_medido1);


% [xfinal,yfinal,zfinal] = pol2cart(azimute_medido1,phi_medido1,zfinal);
% subplot(2,1,2)
% plot3(xfinal,yfinal,zfinal);
% 
% grid on
% xlabel('xfinal')
% ylabel('yfinal')
% zlabel('zfinal')
