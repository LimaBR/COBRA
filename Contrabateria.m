clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
t = linspace(-5, 5, amostras);
random=randn(1,102);
a=random(101);
b=random(102);
azimute=pi/3;
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

x=t*cos(azimute);
y=t*sin(azimute);
z = a*(x.^2+y.^2)+b;
for n=1:1:100
    z1(n)=z(n)+random(n);

end
%% Plotando os gráficos

 
plot3(x,y,z1);

