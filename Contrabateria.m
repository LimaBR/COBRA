clear;
clc
close all;


amostras=100;

x = linspace(-5, 5, amostras);

random=randn(1,10);

a=random(1);
b=random(2);


y1 = a*x.^2+b;


f = figure();

ax = axes();

hold(ax); 
% to plot multiple lines on one axes

plot(x, y1);

