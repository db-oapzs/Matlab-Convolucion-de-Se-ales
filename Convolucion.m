close all; clear; %Cierro ventanas y limpio variables 
% Definicion de Parametros 
T = 5; % Duración de las señales en segundos
f = 0.666; % Frecuencia en Hertz
A = 5; % Amplitud en voltios
t = 0:0.01:T; % Vector de tiempo

% Definir la señal senoidal
u = A*cos(2*pi*f*t);

% Definir el tren de pulsos
p = zeros(size(t));
p(t >= 0 & t <= 0.5) = A;
p(t >= 1 & t <= 1.5) = A;
p(t >= 2 & t <= 2.5) = A;
p(t >= 3 & t <= 3.5) = A;
p(t >= 4 & t <= 4.5) = A;

% Convolucionar las señales
y = conv(p, u);

% Grafica de señales

% Señal senoidal
subplot(3,1,1);
plot(t, u, 'b');
xlabel('Tiempo (s)');
ylabel('u(t)');
title('Señal senoidal');
%Señal Tren de pulsos
subplot(3,1,2);
plot(t, p, 'r');
xlabel('Tiempo (s)');
ylabel('p(t)');
title('Tren de pulsos');
%Señal resultante de la convolucion entre S1 y S2
subplot(3,1,3);
plot(t, y(1:length(t)), 'g');
xlabel('Tiempo (s)');
ylabel('y(t)');
title('Convolución de u(t) y p(t)');
