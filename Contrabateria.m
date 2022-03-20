clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
x = linspace(-5, 5, amostras);
random=randn(1,102);
a=random(101);
b=random(102);
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

y = a*x.^2+b;
for n=1:1:100
    y1(n)=y(n)+random(n);

end
%% Plotando os gráficos

f = figure();
ax = axes();

hold(ax); 
plot(x, y);
plot(x, y1);

