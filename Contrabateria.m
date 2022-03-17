clear all;
clc
close all;
parabola=randn(1,3);
a=parabola(1);
b=parabola(2);
c=parabola(3);

for x=1:1:10

    y(x)=a*x^2+b*x+c;

end

plot(x,y);