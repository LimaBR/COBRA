clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=1000;
t = linspace(-50000, 50000, amostras);


%elevaçao
randomz=0.002*(randn(1,amostras)-0.5);
%distancia
randomx=0.0005*(randn(1,amostras)-0.5);
%azimute
randomy=0.01*(randn(1,amostras)-0.5);

random_other=randn(1,amostras);

%ponto de origem do inimigo
x0=abs(5000*random_other(3));
y0=abs(5000*random_other(4));
z0=abs(10000);

% a=-1*abs(random_other(1));
% b=900000000000*abs(random_other(2));

c1=25255.51;
c2=-9.89e-6;
c3=-9.89e-6;


azimute=pi*random_other(6);
theta=random('Uniform',0,pi/4);
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

x=t.*cos(azimute)+x0;
y=t.*sin(azimute)+y0;


%z = a*(x.^2+y.^2)+b+z0;
z=c1/10+(c2*(x.^2+y.^2)+z0)/10;
%z=tan(theta)*(x+y)+c3*((sec(theta))^2)*(x.^2+y.^2)+z0;


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


%% Mandando para o labview o ideal



out = [distancia_medida; azimute_medido; phi_medido];
writematrix(out, 'LabVIEW\Main Folder\adppadrao.csv');


%% COlocando ruido

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

%% Mandando para o labview com ruido

out1 = [distancia_medida1; azimute_medido1; phi_medido1];
writematrix(out1, 'LabVIEW\Main Folder\adp.csv');

%subplot(2,1,2)
%plot3(distancia_medida,azimute_medido1,phi_medido1);
