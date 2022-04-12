amostras=100;
t = linspace(-5, 5, amostras);
randomz=0.01*randn(1,amostras);
randomx=0.01*randn(1,amostras);
randomy=0.1*randn(1,amostras);
random_other=randn(1,amostras);
x0=random_other(3);
y0=random_other(4);
z0=random_other(5);
a=-50*abs(randomz(1));
b=10*random_other(2);
azimute=pi/3;
x=t.*cos(azimute)+x0;
y=t.*sin(azimute)+y0;
for n=1:1:amostras
    xs(n)=x(n)+randomx(n);
end
for n=1:1:amostras
    ys(n)=y(n)+randomy(n);
end
z = a*(xs.^2+ys.^2)+b+z0;
for n=1:1:amostras
    zs(n)=z(n)+randomz(n);
end
xyz = [xs; ys; zs]
writematrix (xyz, 'xyz.csv');