%%% Laboratoire 5 MTH1210 Philippe Lacasse-Labelle, Antoine Busqueclc;
close all;
%% Question 1
% a) Fait à la main, voir feuille.
% b)
% Donnees
t0 = 1;
y0 = 1;
h = 0.1;
nbPas = (6-1)/h;
% Solution analytique
t=1:h:6;
solAnalytique = t1.*(log(t1) + 1);

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

% Question 2
% a) voir feuille
% b)
%donnees
h1 = 0.5;
h2 = 0.25;
h3 = 0.125;
t0 = 0;
y0 = 5;

t = 0:h3:2;
solAnalytique2 = 5 * exp(-7 .* t);

nbPas = (2-0)/h1;
[t1,y1] = euler('eqndiffLab5Q2', t0, y0, h1, nbPas);

nbPas = (2-0)/h2;
[t2,y2] = euler('eqndiffLab5Q2', t0, y0, h2, nbPas);

nbPas = (2-0)/h3;
[t3,y3] = euler('eqndiffLab5Q2', t0, y0, h3, nbPas);

figure;
plot(t, solAnalytique, 'g -', t1, y1, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.5')

figure;
plot(t, solAnalytique, 'g -', t2, y2, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.25')

figure;
plot(t, solAnalytique, 'g -', t3, y3, 'b +');
title('Sol. analytique et numériques de y selon Euler');
xlabel('t');
ylabel('y');
legend('Solution Analytique', 'Méthode d''Euler, h = 0.125')
