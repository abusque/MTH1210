%%% Laboratoire 2 MTH1210 Philippe Lacasse-Labelle, Antoine Busque
clc;
close all;
%% Question 1
format long e
% a)
eps
% b)
abs(3*(4/3 - 1) - 1) == eps
% c)
1 + eps / 4 == 1
1 + eps / 2 == 1
1 + (3 * eps) / 4 == 1
1 + eps == 1
% On remarque que les deux premiers résultats sont égaux puisque eps est la
% plus petite valeur possible , donc quand on divise cette valeur le
% resultat est nul. Pour le troisieme, c'est 3/4 de eps, donc le système va
% arrondir automatiquement au prochain eps. Pour le dernier, on additionne
% tout simplement eps à 1, c'est donc logique que le résultat ne soit pas
% égal à 1.

% d)
epsm = 1;
while (1 + epsm > 1)
    epsm = epsm / 2;
end
epsm = 2 * epsm;
epsm == eps

%% Question 2
% a)
%voir lab2q2.m

% b)
n1 = 10^5:2*10^5:10^7;
y1 = lab2q2(n1) - exp(1);

figure; % Permet d'afficher les graphiques dans une figure window chaque
plot(n1, y1 , '-+');
axis([-Inf Inf -5*10^-6 5*10^-7]); %-Inf à Inf va effectuer un scaling auto
title('La différence entre estimation de e et e')
xlabel('L''axe des n');
ylabel('L''axe des y');
legend('(1 + 1/n)^n - e');

% La différence suit une loi logarithmique , c'est à dire plus le n croît,
% moins la différence entre l'estimation de e et e est grande.

n2 = 10^15:2*10^15:10^17;
y2 = lab2q2(n2) - exp(1);

figure; % Permet d'afficher les graphiques dans une figure window chaque
plot(n2, y2 , '-+');
axis([-Inf Inf -Inf Inf]); %-Inf à Inf va effectuer un scaling auto
title('La différence entre estimation de e et e')
xlabel('L''axe des n');
ylabel('L''axe des y');
legend('(1 + 1/n)^n - e');

% Au debut, l'algorithme donne une estimation valide, mais soudainement, 
% 1/n devient plus petit que eps/2 , donc le resultat se fait
% automatiquement arrondir à 0. Ainsi, on se retrouve avec 1^n = 1, donc
% on se retrouve avec la différence 1 - e (~-1.7)

% d) 
% Quand 1/n < eps / 2 = 1.11*10^-16. Ainsi, on obtient n = 1.11*10^16.

%% Question 3
% a)
quotientTan = zeros(1, 15);

x = 1;
for k=1:15
    h = 10^-k;
    quotientTan(k) = (tan(x + h) - tan(x)) / h;
end

% b)
erreurAbsolue = zeros(1, 15);

for k=1:15
    h = 10^-k;
    erreurAbsolue(k) = abs(quotientTan(k) - sec(x)^2);
end

% c)

n3 = 15:-1:1;
h = 10.^-n3;
y3 = abs(quotientTan(n3) - sec(x)^2);

figure; % Permet d'afficher les graphiques dans une figure window chaque
plot(h,y3,'-+');
axis([-Inf Inf -Inf Inf]); %-Inf à Inf va effectuer un scaling auto
title('L''erreur en fonction de h entre l''estimation de la dérivée de tan et de la dérivée de tan')
xlabel('L''axe des h');
ylabel('L''axe des y');
legend('erreur absolue');

% d)
% La plus petite valeur est 2.554135347665465e-08 pour n = 8
% L'erreur remonte après h = 10^-8, car la différence entre tan(x+h) et 
% tan(x) devient tellement minime de tel sorte tan(x+h) et tan(x) sont 
% quasiment identiques. En soustrayant deux nombres si proches, il s'ensuit
% une perte de chiffres significatifs, ce qui cause l'erreur.
