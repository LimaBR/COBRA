clear all;
close;
clc;
%% Pegando dados do inimigo
hold on;
fig = openfig("launch1.fig");


axObjs = fig.Children
dataObjs = axObjs.Children

x = dataObjs(1).XData
y = dataObjs(1).YData
z = dataObjs(1).ZData

%close(fig);
%% equaçao da parabola de segurança
%y=-g/2.*(v0)^2*x.^2+vo^2/2*g

%Estou com dificuldade em pegar pontos da figura original e interpola elas;

t = linspace(-5,5,100);
x=t;
y=t;
[xq,yq]=meshgrid(-5:5:5);


Zq=interp2(x,y,z,xq,yq,"cubic");

figure
surf(xq,yq,Zq);


hold off;


