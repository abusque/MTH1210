%%% Laboratoire 5 MTH1210 Philippe Lacasse-Labelle, Antoine Busque
clc;
close all;
%% Question 1
% a) Fait à la main, voir feuille.
% b)

% Donnees
t0 = 1;
y0 = 1;
h = 0.1;
nbPas = (6-1)/h;

% Solution analytique, trouvee a la main
t=1:h:6;
solAnalytique = t.*(log(t) + 1);

% Solution numerique, methode du pt milieu
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);

% Affichage du graphique
figure;
plot(t, solAnalytique, 'g -', t1, y1, 'b +');
title('Sol. analytiques et numerique de y selon la methode du pt milieu');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode du point milieu')

% Calcul de l'erreur relative
errRel = abs(y1 - solAnalytique.')./y1; % .' transpose la matrice solAnalytique
maxErr = max(errRel) % erreur relative maximale

% c) voir feuille pour le tableau
% Pour ordre de convergence: (h1/h1)^n = E(h1)/E(h2)
% Ou n est l'ordre de convergence, E = ynum(x0) - y(x0)

y6 = solAnalytique(end);

h = 1/128;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
tmp = y1(end) - y6;

h = 1/64;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
(y1(end) - y6) / tmp
tmp = (y1(end) - y6);

h = 1/32;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
(y1(end) - y6) / tmp
tmp = (y1(end) - y6);

h = 1/16;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
(y1(end) - y6) / tmp
tmp = (y1(end) - y6);

h = 1/8;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
(y1(end) - y6) / tmp
tmp = (y1(end) - y6);

h = 1/4;
nbPas = (6-1)/h;
[t1, y1] = ptmilieu('eqndiffLab5Q1',t0,y0,h,nbPas);
(y1(end) - y6) / tmp
tmp = (y1(end) - y6);

%% Question 2
% a) voir feuille
% b)

%donnees
h1 = 0.5;
h2 = 0.25;
h3 = 0.125;
t0 = 0;
y0 = 5;

t = 0:h3:2;
solAnalytique2 = 5 * exp(-7 .* t); % Trouvee a la main

% 3 solutions numeriques trouvees par Euler, avec h differents
nbPas1 = (2-0)/h1;
[t1,y1] = euler('eqndiffLab5Q2', t0, y0, h1, nbPas1);

nbPas2 = (2-0)/h2;
[t2,y2] = euler('eqndiffLab5Q2', t0, y0, h2, nbPas2);

nbPas3 = (2-0)/h3;
[t3,y3] = euler('eqndiffLab5Q2', t0, y0, h3, nbPas3);

% Graphiques des 3 solutions numeriques et la solution analytique
figure;
plot(t, solAnalytique2, 'g -', t1, y1, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.5')

figure;
plot(t, solAnalytique2, 'g -', t2, y2, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.25')

figure;
plot(t, solAnalytique2, 'g -', t3, y3, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.125')

% Erreur absolue pour les 3 pas differents
err1 = zeros(1, nbPas1);
err2 = zeros(1, nbPas2);
err3 = zeros(1, nbPas3);

for n =1:nbPas1 + 1
    % Le pas de la solution analytique est 4 fois plus petit que celui de
    % la solution y1, donc on fait 4n - 3 pour obtenir l'index
    % correspondant
    err1(n) = abs(solAnalytique2(4 * n - 3) - y1(n));
end

for n =1:nbPas2 + 1
    % Le pas de la solution analytique est 2 fois plus petit que celui de
    % la solution y1, donc on fait 2n - 1 pour obtenir l'index
    % correspondant
    err2(n) = abs(solAnalytique2(2 * n - 1) - y2(n));
end

for n =1:nbPas3 + 1
    err3(n) = abs(solAnalytique2(n) - y3(n));
end

% Graphique des 3 erreurs absolues
figure;
plot(t1, err1, 'g o', t2, err2, 'b +', t3, err3, 'r x');
title('Erreurs absolues entre la solution analytiques et les solutions numeriques par Euler');
xlabel('t');
ylabel('y');
legend('Erreur pour h = 0.5', 'Erreur pour h = 0.25', 'Erreur pour h = 0.125')

% La solution numerique selon la methode d'Euler est instable pour le pas
% h1 = 0.5 puisque les erreurs absolues dans ce cas croissent. Les erreurs
% absolues diminuent dans les 2 autres cas (h2 = 0.25 et h3 = 0.125). Ces
% solutions sont donc stables.

%c
hExp1 = 0.29;
hExp2 = 0.2855;
hExp3 = 0.28;

nbPasExp1 = (2-0)/hExp1;
[tExp1,yExp1] = euler('eqndiffLab5Q2', t0, y0, hExp1, nbPasExp1);

nbPasExp2 = (2-0)/hExp2;
[tExp2,yExp2] = euler('eqndiffLab5Q2', t0, y0, hExp2, nbPasExp2);

nbPasExp3 = (2-0)/hExp3;
[tExp3,yExp3] = euler('eqndiffLab5Q2', t0, y0, hExp3, nbPasExp3);

%Graphique des experimentations
figure;
plot(t, solAnalytique2, 'y -', tExp1, yExp1, 'g o', tExp2, yExp2, 'b +', tExp3, yExp3, 'r x');
title('Erreurs absolues entre la solution analytiques et les solutions numeriques par Euler');
xlabel('t');
ylabel('y');
legend('Solution analytique', 'h = 0.29', 'h = 0.2855', 'h = 0.28')

% d)
% Voir feuille, 0 < h < 2/7
