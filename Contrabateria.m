clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
t = linspace(-5, 5, amostras);

randomz=0.01*randn(1,100);
randomx=0.01*randn(1,100);
randomy=0.1*randn(1,100);
random_other=randn(1,100);

%ponto de origem do inimigo
x0=random_other(3);
y0=random_other(4);
z0=random_other(5);

a=-10*abs(randomz(1));
b=random_other(2);

azimute=pi/3;
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

x=t.*cos(azimute)+x0;
y=t.*sin(azimute)+y0;

for n=1:1:100
    x1(n)=x(n)+randomx(n);

end

for n=1:1:100
    y1(n)=y(n)+randomy(n);

end

z = a*(x1.^2+y1.^2)+b+z0;
for n=1:1:100

    z1(n)=z(n)+randomz(n);

end
%% Plotando os gráficos

 
plot3(x1,y1,z1);
axis equal
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
