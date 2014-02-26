%%% Laboratoire 4 MTH1210 Philippe Lacasse-Labelle, Antoine Busque
clc;
close all;
%% Question 1
% Donnees
t0 = 0;
y0 = 1000;
h = 1;
nbpas = 30;

% a) et b) à la main, voir rapport

% c)
% Solution analytique
m = 100000;
k = 2.0e-6;
t = 0:1:30;

solAnalytique = 1./((1./1000 - 1./m).*exp(-k.*m.*t) + 1./m);
[t,y1] = euler('eqndiff', t0, y0, h, 30);
[t,y2] = rk4('eqndiff', t0, y0, h, 30);

figure;
plot(t, solAnalytique, 'g -', t, y1, 'b +', t, y2, 'r x');
title('Sol. analytique et numériques à la propagation d''une maladie');
xlabel('Nombre de jours');
ylabel('Nombre de personnes infectées');
legend('Solution Analytique', 'Méthode d''Euler', 'Méthode Runge-Kutta')

%% Question 2
% a) À la main, voir rapport
% b) 
t0 = 0;
y0 = [0 200];
h = 0.15;
nbpas = 75;

[t, y1] = euler('eqndiff2', t0, y0, h, nbpas);
[t, y2] = rk4('eqndiff2', t0, y0, h, nbpas);

posEuler = y1(:,1);
posRK = y2(:,1);

figure;
plot(t, posEuler, 'r x', t, posRK, 'b +');
title('Position d''une flèche en fonction du temps');
xlabel('Temps en secondes');
ylabel('Hauteur en pieds');
legend('Méthode d''Euler', 'Méthode Runge-Kutta')

vitesseEuler = y1(:,2);
vitesseRK = y2(:,2);

figure;
plot(t, vitesseEuler, 'r x', t, vitesseRK, 'b +');
title('Vitesse d''une flèche en fonction du temps');
xlabel('Temps en secondes');
ylabel('Vitesse en pieds/s');
legend('Méthode d''Euler', 'Méthode Runge-Kutta')

% c)
[maxHauteur indexSommet] = max(posRK);
maxHauteur
tempsSommet = h * indexSommet
vitesseSommet = vitesseRK(indexSommet)
f = eqndiff2(tempsSommet, [maxHauteur vitesseSommet]);
accelSommet = f(2)

% d)
% On veut commencer au sommet pour éviter de prendre les valeurs min lorsque la flèche monte
[minHauteur indexSol] = min(abs(posRK(indexSommet:end)))
minHauteur
% On additionne indexSommet puisque indexSol considère que indexSommet est
% son 0
tempsSol = h * (indexSol + indexSommet)
