%%% Laboratoire 1 MTH1210 Philippe Lacasse-Labelle, Antoine Busque
clc;
close all;
%% Question 1
% a)
% zeros permet de preallouer le vecteur pour accelerer l'execution
factoriel = zeros(1, 13);

for i=1:13
    factoriel(i) = factorial(i);
end

% b)
stirling = zeros(1, 13);

for i=1:13
    stirling(i) = sqrt(2*pi*i)*(i/exp(1))^i;
end

% c)
erreurAbsolue = zeros(1, 13);
erreurRelative = zeros(1, 13);

for i=1:13
    erreurAbsolue(i) = abs(factoriel(i) - stirling(i));
    erreurRelative(i) = abs(factoriel(i) - stirling(i)) / factoriel(i);
end

% d)
% L'erreur absolue croît à mesure que n croît, cependant la factorielle
% croît plus rapidement que l'erreur ce qui veut dire que l'erreur relative
% diminue quand n augmente. Ainsi, l'approximation est meilleure quand n
% augmente.

%% Question 2
% a)
x = -1:.1:1;
y = atan(x);

% Developpements de Taylor
P1 = x;
P3 = x - (x.^3./3) + (x.^5./5);
P5 = x - (x.^3./3) + (x.^5./5) - (x.^7./7) + (x.^9./9);

figure; % Permet d'afficher les graphiques dans une figure window chaque
plot(x, y, '-+', x, P1, '-o', x, P3, '-*', x, P5, '-x');
axis([-1 1 -1 1]);
title('atan(x) et ses développement de Taylor')
xlabel('L''axe des x');
ylabel('L''axe des y');
legend('atan', 'P1', 'P3', 'P5');

% b)

% erreurs absolues
e1 = abs(y - P1);
e3 = abs(y - P3);
e5 = abs(y - P5);

figure; % Permet d'afficher les graphiques dans une figure window chaque
plot(x, e1, '-o', x, e3, '-*', x, e5, '-x');
axis([-1 1 0 0.3]);
title('les erreurs absolues entre atan(x) et ses développement de Taylor')
xlabel('L''axe des x');
ylabel('L''axe des y');
legend('e1', 'e3', 'e5');

% c)
% On constate en comparant les graphiques que l'erreur absolue entre la
% fonction atan(x) et ses developpements de Taylor s'accroît plus on
% s'éloigne de 0. En outre, plus le degré du polynôme est élevée, plus
% l'erreur absolue est petite, donc meilleure sera l'approximation.
