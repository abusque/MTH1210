%%% Devoir MTH1210 Antoine Busque
%% Question 1
% Donnees:

t0 = 0;
y0 = 1;
h = 0.1;
nbPas = (2 - 0) / h;

% Solution analytique, telle qu'indiquee sur le questionnaire
t=0:h:2;
solAnalytique = (1/2).*(exp(t) + exp(-t));

% a)
% Solution numerique par la methode d'Euler
[t, y1] = euler('examQ1eqndiff', t0, y0, h, nbPas);

solAnalytique(1)-y1(1)
solAnalytique(11) - y1(11)
solAnalytique(21) - y1(21)

% b) voir feuille

% c)

% Solution numerique par la methode de Runge-Kutta, ordre 4
h = 1/4;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e4 = solAnalytique(21) - y2(2/h + 1)

h = 1/8;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e8 = solAnalytique(21) - y2(2/h + 1)

h = 1/16;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e16 = solAnalytique(21) - y2(2/h + 1)

h = 1/32;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e32 = solAnalytique(21) - y2(2/h + 1)

h = 1/64;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e64 = solAnalytique(21) - y2(2/h + 1)

h = 1/128;
nbPas = (2 - 0) / h;
[t, y2] = rk4('examQ1eqndiff', t0, y0, h, nbPas);
e128 = solAnalytique(21) - y2(2/h + 1)

e8/e16
e16/e32
e32/e64
e64/e128

