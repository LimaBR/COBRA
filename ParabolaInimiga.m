clear;
clc
close all;
%% Definição de constantes e coeficientes 

amostras=100;
t = linspace(-3000,3000, amostras);


%elevaçao
randomz=0.005*(randn(1,amostras)-0.5);
%distancia
randomx=0.0005*(randn(1,amostras)-0.5);
%azimute
randomy=0.00009*(randn(1,amostras)-0.5);

random_other=randn(1,amostras);

%ponto de origem do inimigo
a=-abs(5*random_other(3));
c=-abs(5*random_other(5));
delta1=sqrt(4*a*c);
b=random('Uniform',0,delta1);
d=-1*abs(random_other(1));
f=-10*abs(random_other(2));
delta2=sqrt(4*d*f);
e=random('Uniform',0,delta2);

azimute=pi*random_other(6);
%% Gerando trajetorias parabolicas com implementação de ruido de distribuiçao normal (1,0)

x=t.*cos(azimute)+x0;
y=t.*sin(azimute)+y0;


zx = a*(x.^2)+b*x+c;
zy = d*(y.^2)+e*y+f;
z=zx+zy;

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


%% Plotando os gráficos

 
% plot3(x1,y1,z1);
% axis equal
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')


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

%%

out1 = [distancia_medida1; azimute_medido1; phi_medido1];
writematrix(out1, 'LabVIEW\Main Folder\adp.csv');

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
