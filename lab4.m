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

% Donnees
m = 100000;
k = 2.0e-6;
t = 0:1:30;

solAnalytique = 1./((1./1000 - 1./m).*exp(-k.*m.*t) + 1./m); % Trouvee a la main
[t,y1] = euler('eqndiff', t0, y0, h, 30); % Methode d'Euler
[t,y2] = rk4('eqndiff', t0, y0, h, 30); % Runge-kutta ordre 4

% Graphique des 3 solutions (analytique, euler, rk4)
figure;
plot(t, solAnalytique, 'g -', t, y1, 'b +', t, y2, 'r x');
title('Sol. analytique et numériques à la propagation d''une maladie');
xlabel('Nombre de jours');
ylabel('Nombre de personnes infectées');
legend('Solution Analytique', 'Méthode d''Euler', 'Méthode Runge-Kutta')

%% Question 2
% a) À la main, voir rapport
% b)

% Donnees
t0 = 0;
y0 = [0 200];
h = 0.15;
nbpas = 75;

[t, y1] = euler('eqndiff2', t0, y0, h, nbpas); % Methode d'euler
[t, y2] = rk4('eqndiff2', t0, y0, h, nbpas); % Methode runge-kutta

% : veut dire toutes les rangees, et 1 veut dire qu'on garde seulement la
% premiere colonne. Dans la premiere colonne se trouve y (dans ce cas la
% position)
posEuler = y1(:,1);
posRK = y2(:,1);

% Graphique de la position en fct du temps, selon les 2 methodes
% numeriques
figure;
plot(t, posEuler, 'r x', t, posRK, 'b +');
title('Position d''une flèche en fonction du temps');
xlabel('Temps en secondes');
ylabel('Hauteur en pieds');
legend('Méthode d''Euler', 'Méthode Runge-Kutta')

% : veut dire toutes les rangees, et 2 veut dire qu'on garde seulement la
% deuxieme colonne. Dans la deuxieme colonne se trouve y' (dans ce cas la
% vitesse)
vitesseEuler = y1(:,2);
vitesseRK = y2(:,2);

% Graphique de la vitesse en fct du temps, selon les 2 methodes numeriques
figure;
plot(t, vitesseEuler, 'r x', t, vitesseRK, 'b +');
title('Vitesse d''une flèche en fonction du temps');
xlabel('Temps en secondes');
ylabel('Vitesse en pieds/s');
legend('Méthode d''Euler', 'Méthode Runge-Kutta')

% c)
% max(posRK) retourne la valeur max du vecteur et l'index de cette valeur
[maxHauteur indexSommet] = max(posRK);
maxHauteur
tempsSommet = h * indexSommet
vitesseSommet = vitesseRK(indexSommet)
% eqndiff2 est en realite y'', donc l'acceleration. On trouve ainsi
% l'acceleration au sommet. A noter qu'on prend la deuxieme valeur de f, la
% premiere etant le temps t
f = eqndiff2(tempsSommet, [maxHauteur vitesseSommet]);
accelSommet = f(2)

% d)
% On veut commencer au sommet pour éviter de prendre les valeurs min lorsque la flèche monte
[minHauteur indexSol] = min(abs(posRK(indexSommet:end)))
minHauteur
% On additionne indexSommet puisque indexSol considère que indexSommet est
% son 0
tempsSol = h * (indexSol + indexSommet)
